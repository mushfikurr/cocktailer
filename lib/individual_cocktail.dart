import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_actions.dart';
import 'package:flutter_application_1/colors.dart';
import 'package:flutter_application_1/models.dart';
import 'package:flutter_application_1/view_recipe.dart';

class IndividualCocktail extends StatefulWidget {
  const IndividualCocktail({super.key});

  @override
  State<IndividualCocktail> createState() => _IndividualCocktailState();
}

class _IndividualCocktailState extends State<IndividualCocktail> {
  late Future<Drink> futureDrink;

  @override
  void initState() {
    super.initState();
    futureDrink = fetchRandomDrink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cocktail.shade300,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0.5,
          title: const Text("cocktailer."),
          titleTextStyle: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FutureDrinkImage(futureDrink: futureDrink),
            const SizedBox(height: 26),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FutureDrinkTitle(futureDrink: futureDrink),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Expanded(
                    child: FutureDrinkTagsScrollable(futureDrink: futureDrink),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ViewRecipe(futureDrink: futureDrink)),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: cocktail.shade500,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                      ),
                      icon: const Icon(Icons.search_sharp, color: Colors.black),
                      label: Text("View Recipe",
                          style: Theme.of(context).textTheme.labelLarge),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FutureDrinkTagsScrollable extends StatelessWidget {
  const FutureDrinkTagsScrollable({
    super.key,
    required this.futureDrink,
  });

  final Future<Drink> futureDrink;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureDrink,
      builder: (BuildContext context, AsyncSnapshot<Drink> snapshot) {
        if (snapshot.hasData) {
          final drink = snapshot.data!;
          List<CustomChip> chips = [
            drink.strDrinkAlternate,
            drink.strVideo,
            drink.strAlcoholic,
            drink.strCategory,
            drink.strIBA,
          ]
              .whereType<String>()
              .map((displayText) => CustomChip(displayText: displayText))
              .toList();

          return Align(
            alignment: Alignment.topLeft,
            child: Wrap(
              spacing: 10,
              children: chips,
            ),
          );
        } else if (snapshot.hasError) {
          return const Text("There was an error loading the tags.");
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    required this.displayText,
  });

  final String displayText;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: cocktail.shade500,
      side: BorderSide(color: Colors.black.withOpacity(0.03)),
      label: Text(displayText, style: Theme.of(context).textTheme.labelMedium),
    );
  }
}

class FutureDrinkImage extends StatelessWidget {
  const FutureDrinkImage({
    super.key,
    required this.futureDrink,
  });

  final Future<Drink> futureDrink;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureDrink,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1), spreadRadius: 1)
                ],
                image: DecorationImage(
                  image: Image.network(snapshot.data!.strDrinkThumb!).image,
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1), spreadRadius: 1)
                ],
                color: cocktail.shade500,
                borderRadius: const BorderRadius.all(Radius.circular(24.0)),
              ),
            ),
          );
        } else {
          return Expanded(
            flex: 2,
            child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1), spreadRadius: 1)
                  ],
                  color: cocktail.shade500,
                  borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                ),
                alignment: Alignment.center,
                child: const CircularProgressIndicator(color: Colors.black)),
          );
        }
      },
    );
  }
}

class FutureDrinkTitle extends StatelessWidget {
  const FutureDrinkTitle({
    super.key,
    required this.futureDrink,
  });

  final Future<Drink> futureDrink;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Drink>(
      future: futureDrink,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Flexible(
            child: Text(
              snapshot.data!.strDrink,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).textTheme.titleMedium?.color),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator(color: Colors.black);
      },
    );
  }
}

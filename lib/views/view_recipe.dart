import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/colors.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/models.dart';
import 'package:flutter_application_1/views/view_individual_cocktail.dart';

class ViewRecipe extends StatelessWidget {
  const ViewRecipe({super.key, required this.futureDrink});

  final Future<Drink> futureDrink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cocktail.shade300,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0.5,
          title: const Text("cocktailer."),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage()));
                },
                icon: const Icon(Icons.home))
          ],
          titleTextStyle: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FutureBuilder(
                future: futureDrink,
                builder: (BuildContext context, AsyncSnapshot<Drink> snapshot) {
                  if (snapshot.hasData) {
                    return Flexible(
                      child: Text(
                        snapshot.data!.strDrink,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.color),
                      ),
                    );
                  } else {
                    return Text(
                      "Loading...",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.color),
                    );
                  }
                },
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              FutureBuilder(
                future: futureDrink,
                builder: (BuildContext context, AsyncSnapshot<Drink> snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                        "Served in ${snapshot.data!.strGlass ?? "glass"}.",
                        style: Theme.of(context).textTheme.titleMedium);
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 18),
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: RecipeCard(futureDrink: futureDrink),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Text(
                "Ingredients",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            flex: 2,
            child: Column(
              children: [FutureIngredientCards(futureDrink: futureDrink)],
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const IndividualCocktail()),
          );
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class FutureIngredientCards extends StatelessWidget {
  const FutureIngredientCards({
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
          List<(String, String)>? ingredients =
              getIngredientsAsList(snapshot.data);

          List<IngredientCard>? cards = ingredients
              .map((e) =>
                  IngredientCard(ingredientName: e.$1, ingredientMeasure: e.$2))
              .toList();

          return Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(2.0),
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0,
              crossAxisCount: 2,
              children: AnimateList(
                  delay: 200.ms,
                  interval: 200.ms,
                  effects: [
                    FadeEffect(duration: 300.ms),
                    ScaleEffect(
                        duration: 150.ms, curve: Curves.fastEaseInToSlowEaseOut)
                  ],
                  children: cards),
            ),
          );
        } else if (snapshot.hasError) {
          return const Text("Error fetching ingredients");
        } else {
          return const Expanded(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.futureDrink,
  });

  final Future<Drink> futureDrink;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), spreadRadius: 1)
        ],
        color: cocktail.shade500,
        borderRadius: const BorderRadius.all(Radius.circular(18.0)),
      ),
      child: Wrap(children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 16, bottom: 16, left: 11, right: 16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(Icons.book)),
                  Text(
                    "Recipe",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 33),
                child: FutureBuilder(
                  future: futureDrink,
                  builder:
                      (BuildContext context, AsyncSnapshot<Drink> snapshot) {
                    if (snapshot.hasData) {
                      return Column(children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(snapshot.data!.strInstructions ??
                                  "No recipe for this cocktail was found."),
                            ),
                          ],
                        ),
                      ]);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

class IngredientCard extends StatelessWidget {
  const IngredientCard({
    super.key,
    this.ingredientName,
    this.ingredientMeasure,
  });

  final String? ingredientName;
  final String? ingredientMeasure;

  @override
  Widget build(BuildContext context) {
    if (ingredientName != null && ingredientMeasure != null) {
      return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: ResizeImage(
              AssetImage('assets/sample_image.jpg'),
              width: 466, // Specify the intended width
              height: 466, // Specify the intended height
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(14.0)),
        ),
        child: Column(
          children: [
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: cocktail.shade500,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(14.0),
                  bottomRight: Radius.circular(14.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 10,
                  bottom: 10,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(ingredientName!,
                              style: Theme.of(context).textTheme.bodyLarge),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(ingredientMeasure!,
                              style: Theme.of(context).textTheme.bodyLarge),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }
}

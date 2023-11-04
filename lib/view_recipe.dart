import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/models.dart';

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
                    return SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 18),
          SingleChildScrollView(
            child: Expanded(
              flex: 1,
              child: RecipeCard(futureDrink: futureDrink),
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
            MaterialPageRoute(builder: (context) => const MyHomePage()),
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
              children: cards,
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
        borderRadius: const BorderRadius.all(Radius.circular(24.0)),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
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
                builder: (BuildContext context, AsyncSnapshot<Drink> snapshot) {
                  if (snapshot.hasData) {
                    List<Row>? instructions =
                        splitInstructionsIntoList(snapshot.data!)
                            ?.map(
                              (e) => Row(
                                children: [
                                  Flexible(
                                    child: Text(e),
                                  ),
                                ],
                              ),
                            )
                            .toList();
                    return Column(
                      children: instructions!,
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )
          ],
        ),
      ),
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

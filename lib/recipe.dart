import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors.dart';

class Recipe extends StatelessWidget {
  const Recipe({super.key});

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
            children: [
              Text(
                "Mojito",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).textTheme.titleMedium?.color),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Text(
                "Served in highball glass.",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Expanded(flex: 1, child: RecipeCard()),
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
              children: [
                Expanded(
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(2.0),
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                    crossAxisCount: 2,
                    children: const <Widget>[
                      IngredientCard(),
                      IngredientCard(),
                      IngredientCard(),
                      IngredientCard(),
                      IngredientCard(),
                      IngredientCard(),
                      IngredientCard(),
                      IngredientCard(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
  });

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
            const Padding(
              padding: EdgeInsets.only(left: 33),
              child: Column(
                children: [
                  Row(
                    children: [Text("Hello")],
                  ),
                  Row(
                    children: [Text("Hello")],
                  ),
                  Row(
                    children: [Text("Hello")],
                  ),
                ],
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
  });

  @override
  Widget build(BuildContext context) {
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
                      Text("Squeeze of Lemon",
                          style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                  const Row(
                    children: [
                      Text("One"),
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
}

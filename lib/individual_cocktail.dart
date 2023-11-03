import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors.dart';
import 'package:flutter_application_1/recipe.dart';

class IndividualCocktail extends StatelessWidget {
  const IndividualCocktail({super.key});

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
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1), spreadRadius: 1)
                  ],
                  image: const DecorationImage(
                    image: AssetImage("assets/sample_image.jpg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                ),
              ),
            ),
            const SizedBox(height: 26),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Mojito",
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
                    ],
                  ),
                  const SizedBox(height: 4),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Wrap(
                          spacing: 10,
                          children: [
                            Chip(
                              backgroundColor: cocktail.shade500,
                              side: BorderSide(
                                  color: Colors.black.withOpacity(0.03)),
                              label: Text("Hello",
                                  style:
                                      Theme.of(context).textTheme.labelMedium),
                            ),
                            Chip(
                              backgroundColor: cocktail.shade500,
                              side: BorderSide(
                                  color: Colors.black.withOpacity(0.03)),
                              label: Text("Hello",
                                  style:
                                      Theme.of(context).textTheme.labelMedium),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                              builder: (context) => const Recipe()),
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

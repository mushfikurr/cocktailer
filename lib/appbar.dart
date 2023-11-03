import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0.5,
        title: const Text("cocktailer."),
        titleTextStyle: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600));
  }
}

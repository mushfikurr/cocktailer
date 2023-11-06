import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/colors.dart';
import 'package:flutter_application_1/views/view_individual_cocktail.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: non_constant_identifier_names

void main() {
  runApp(const MyApp());
  Animate.restartOnHotReload = true;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: cocktail,
          scaffoldBackgroundColor: cocktail.shade500,
          textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AnimatedTapHere extends StatefulWidget {
  @override
  _AnimatedTapHereState createState() => _AnimatedTapHereState();
}

class _AnimatedTapHereState extends State<AnimatedTapHere>
    with TickerProviderStateMixin {
  double _letterSpacing = 4;
  late AnimationController controller;
  static const int initialDurationMs = 500;

  @override
  void initState() {
    super.initState();

    // Create an animation controller
    controller = AnimationController(
      duration: const Duration(milliseconds: initialDurationMs),
      vsync: this,
    );

    // Define a Tween for animating the letterSpacing
    final letterSpacingTween = Tween<double>(
      begin: 4,
      end: 8,
    );

    controller.forward();
    controller.addListener(() {
      setState(() {
        _letterSpacing = letterSpacingTween.evaluate(controller);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      curve: Curves.fastEaseInToSlowEaseOut,
      style: Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(letterSpacing: _letterSpacing),
      duration: const Duration(milliseconds: initialDurationMs),
      child: const Text('TAP HERE'),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0.5,
          title: const Text("cocktailer."),
          titleTextStyle: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600)),
      body: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const IndividualCocktail()),
            );
          },
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 30,
                child: Image.asset('assets/bubbles.png'),
              ),
              Ink(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/waves.png'),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AnimatedTapHere().animate().fadeIn(
                          delay: const Duration(milliseconds: 200),
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeInOut),
                      const SizedBox(height: 8),
                      Text(
                        'Create A Cocktail',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.color),
                      )
                          .animate()
                          .fadeIn(
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.elasticInOut)
                          .slideY(
                              begin: -0.8,
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.easeInOutCubicEmphasized)
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: cocktail,
          scaffoldBackgroundColor: cocktail.shade500,
          textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)),
      home: const MyHomePage(title: 'cocktailer.'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 1,
          title: Text(widget.title),
          titleTextStyle: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.w600)),
      body: InkWell(
        onTap: () {},
        child: Ink(
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
                Text('TAP HERE',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(letterSpacing: 5)),
                const SizedBox(height: 8),
                Text(
                  'Create A Cocktail',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).textTheme.titleMedium?.color),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

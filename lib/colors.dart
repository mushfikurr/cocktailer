import 'package:flutter/material.dart';

const MaterialColor cocktail =
    MaterialColor(_cocktailPrimaryValue, <int, Color>{
  50: Color(0xFFFFFEF3),
  100: Color(0xFFFFFCE2),
  200: Color(0xFFFFFACE),
  300: Color(0xFFFFF8BA),
  400: Color(0xFFFFF7AC),
  500: Color(_cocktailPrimaryValue),
  600: Color(0xFFFFF495),
  700: Color(0xFFFFF28B),
  800: Color(0xFFFFF081),
  900: Color(0xFFFFEE6F),
});
const int _cocktailPrimaryValue = 0xFFFFF59D;

const MaterialColor cocktailAccent =
    MaterialColor(_cocktailAccentValue, <int, Color>{
  100: Color(0xFFFFFFFF),
  200: Color(_cocktailAccentValue),
  400: Color(0xFFFFFFFF),
  700: Color(0xFFFFFEF7),
});
const int _cocktailAccentValue = 0xFFFFFFFF;

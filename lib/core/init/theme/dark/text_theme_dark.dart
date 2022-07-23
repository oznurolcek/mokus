import 'package:flutter/material.dart';

class TextThemeDark {
  static TextThemeDark? _instance;
  static TextThemeDark get instance {
    return _instance ??= TextThemeDark._init();
  }

  TextThemeDark._init();

  final TextStyle body = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.25,
      color: Color.fromARGB(255, 241, 228, 207));

  final TextStyle bodySmall = const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.25,
      color: Color.fromARGB(255, 223, 187, 133));

  final TextStyle title = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.25,
      color: Color.fromARGB(255, 233, 200, 150));

  final TextStyle headline1 = const TextStyle(
      fontSize: 96,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
      color: Color.fromARGB(255, 199, 140, 85));

  final TextStyle headline2 = const TextStyle(
      fontSize: 60,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
      color: Color.fromARGB(255, 194, 142, 63));

  final TextStyle headline3 = const TextStyle(
      fontSize: 48, fontWeight: FontWeight.w400, color: Colors.orange);

  final TextStyle headline4 = const TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: Colors.orange);

  final TextStyle headline5 = const TextStyle(
      fontSize: 24, fontWeight: FontWeight.w400, color: Colors.orange);
}

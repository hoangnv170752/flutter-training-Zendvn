import 'package:flutter/material.dart';

class ThemeCustom {
  static ThemeData lightTheme = ThemeData(
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
      color: Colors.red,
      fontSize: 30,
    )),
    brightness: Brightness.light,
  );

  static ThemeData dartTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.blue,
        fontSize: 30,
      ),
    ),
  );
}

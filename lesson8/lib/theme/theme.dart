import 'package:flutter/material.dart';

class Theme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    indicatorColor: Colors.white,
    primaryColor: Colors.lightBlue[800],
    primaryIconTheme: IconThemeData(
      color: Colors.white,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: Colors.red),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    indicatorColor: Colors.white,
    primaryIconTheme: IconThemeData(
      color: Colors.white,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: Colors.blue),
    ),
  );
}

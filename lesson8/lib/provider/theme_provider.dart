import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeData = ThemeMode.light;

  void changeTheme(check) {
    themeData = check ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}

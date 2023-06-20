import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isLight = true;
  bool get isLight => _isLight;

  void handleChangeTheme(bool value) {
    _isLight = value;

    notifyListeners();
  }
}

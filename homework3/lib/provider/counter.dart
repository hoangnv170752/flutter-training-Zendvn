import 'package:flutter/cupertino.dart';

class Counter with ChangeNotifier {
  int _counter = 0;
  String _font = "DancingScript";
  int get getCounter => _counter;
  String get getFont => _font;
  void addCounter() {
    _counter++;
    notifyListeners();
  }

  //increase counter
  void increaseCounter() {
    _counter++;
    notifyListeners();
  }
  //decrease counter

  void decreaseCounter() {
    _counter--;
    notifyListeners();
  }

  void delFont() {
    _font = "";
    notifyListeners();
  }

  void changeFont() {
    _font = "DancingScript";
    notifyListeners();
  }
}

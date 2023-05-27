import 'package:flutter/cupertino.dart';

class Counter with ChangeNotifier {
  int _counter = 0;
  String _font = "DancingScript";
  String _image = "assets/images/wall.jpg";
  int get getCounter => _counter;
  String get getFont => _font;
  String get getImage => _image;
  void addCounter() {
    _counter++;
    notifyListeners();
  }

  void increaseCounter() {
    _counter++;
    notifyListeners();
  }

  void decreaseCounter() {
    _counter--;
    notifyListeners();
  }

  void delFont() {
    _font = "SourceSansPro";
    notifyListeners();
  }

  void changeFont() {
    _font = "DancingScript";
    notifyListeners();
  }

  void changeImage() {
    _image = "assets/images/jungle.png";
    notifyListeners();
  }

  void changeImage2() {
    _image = "assets/images/wall.jpg";
    notifyListeners();
  }
}

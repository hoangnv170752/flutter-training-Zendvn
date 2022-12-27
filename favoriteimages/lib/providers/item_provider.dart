import 'package:flutter/material.dart';

class ItemProvider extends ChangeNotifier{
  int _favorite = 0;
  int get favorite => _favorite;
  void updateFavorite (){
    //print('update')
      _favorite++;
      notifyListeners();
  }
}
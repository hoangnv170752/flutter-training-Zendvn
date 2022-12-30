import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:favoriteimages/model/item_model.dart';
import 'package:flutter/services.dart';

class ItemProvider extends ChangeNotifier{
  List<Item> _items = [];
  int _countItemFavorite = 0;

  List<Item> get items {
    return [..._items];
  }
  int get countItemFavorite {
    return _countItemFavorite;
  }
  List<Item> showItemFavorite () {
    List<Item> data = _items.where((element) => element.isFavorite).toList();
    return data.isEmpty ? [] : data;
  }

  void handleCountItemFav () {
    _countItemFavorite = _items.where((element) => element.isFavorite).length;
    notifyListeners();
  }
  void readJson() async {
    final String response = await rootBundle.loadString('assets/json/items.json');
    final parsedList = await json.decode(response);
    List<Item> listData = 
      List<Item>.from(parsedList.map((data) => Item.fromJson(jsonEncode(data))));
    _items = listData;
    notifyListeners();
  }
}
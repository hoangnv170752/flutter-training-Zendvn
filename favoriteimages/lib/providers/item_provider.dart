import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:favoriteimages/model/item_model.dart';
import 'package:flutter/services.dart';

class ItemProvider extends ChangeNotifier{
  List<Item> _items = [];
  List<Item> get items {
    return [..._items];
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
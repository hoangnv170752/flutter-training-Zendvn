import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/Album.dart';

class AlbumProvider extends ChangeNotifier {
  List<Album> _item = [];

  List<Album> get items {
    return [..._item];
  }

  int _countItemFavorite = 0;

  int get countItemFavorite {
    return _countItemFavorite;
  }

  void handleCountItemFav() {
    _countItemFavorite = _item.where((element) => element.isFavorite).length;
    print(_countItemFavorite);
    notifyListeners();
  }

  Future<List<Album>> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/category.json');
    final dataDecode = await json.decode(response);
    List<Album> data =
        List<Album>.from(dataDecode.map((i) => Album.fromJson(jsonEncode(i))));
    _item = data;
    return data;
  }
}

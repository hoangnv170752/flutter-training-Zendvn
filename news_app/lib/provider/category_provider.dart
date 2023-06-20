import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/repositories/category_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryProvider extends ChangeNotifier {
  final List<int> _selectedId = [];
  List<int> get selectedId => _selectedId;

  Future<List<CategoryModel>> loadCategory() async {
    try {
      List<CategoryModel> rs = await CategoryRepository.getCategoriesNews();
      await readSelectedId().onError((error, stackTrace) => null);

      return rs;
    } catch (e) {
      return Future.error(Exception(e.toString()));
    }
  }

  Future<void> readSelectedId() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey('selected')) {
        final String dataApp = prefs.getString('selected') ?? '';
        if (dataApp.isNotEmpty) {
          _selectedId.clear();
          List<dynamic> lstDecode = jsonDecode(dataApp);
          _selectedId.addAll(lstDecode.map<int>((e) => e as int));
        }
      } else {
        _selectedId.clear();
      }
    } catch (e) {
      return Future.error(Exception(e.toString()));
    }
  }

  Future<void> writeSelectedId() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString(
        'selected',
        jsonEncode(selectedId),
      );
    } catch (e) {
      return Future.error(Exception(e.toString()));
    }
  }

  void handleSelect(int id) {
    if (_selectedId.contains(id)) {
      _selectedId.remove(id);
    } else {
      _selectedId.add(id);
    }

    writeSelectedId().onError((error, stackTrace) => null);

    notifyListeners();
  }
}

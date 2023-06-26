import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lesson_newsapp/models/article_model.dart';
import 'package:lesson_newsapp/models/category_model.dart';
import 'package:lesson_newsapp/repositories/item_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryProvider extends ChangeNotifier {
  final List<int> _selectedId = [];
  List<int> get selectedId {
    _selectedId.sort();
    return _selectedId;
  }

  final List<CategoryModel> _categories = [];
  List<CategoryModel> get categories => _categories;

  Future<List<CategoryModel>> loadCategory() async {
    try {
      List<CategoryModel> rs = await CategoryRepository.getCategories();
      _categories.clear();

      _categories.addAll(rs);
      print(rs);
      return rs;
    } catch (e) {
      return Future.error(Exception(e.toString()));
    }
  }

  Future<List<ArticleModel>> loadArticles(int categoryID,
      {int offset = 0, int limit = 20}) async {
    try {
      List<ArticleModel> rs = await CategoryRepository.getArticles(
        categoryID,
        offset: offset,
        limit: limit,
      );
      return rs;
    } catch (e) {
      return Future.error(Exception(e.toString()));
    }
  }

  Future<List<ArticleModel>> loadAllArticles(int categoryID) async {
    try {
      int total = await CategoryRepository.getTotalOfArticles(categoryID);
      List<ArticleModel> rs = await CategoryRepository.getArticles(categoryID,
          limit: (total / 10).round());

      return rs;
    } catch (e) {
      return Future.error(Exception(e.toString()));
    }
  }

  Future<List<int>> loadSelected() async {
    try {
      await readSelectedId().onError((error, stackTrace) => null);

      return _selectedId;
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

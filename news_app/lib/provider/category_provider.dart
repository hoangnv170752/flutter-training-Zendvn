import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:news_app/model/categorie_model.dart';

class CategoryProvider extends ChangeNotifier {
  final List<CategoryModel> _categories = [];
  List<CategoryModel> get categories => _categories;
  final List<int> _selectedId = [];
  List<int> get selectedId => _selectedId;

  Future<List<CategoryModel>> loadCategory() async {
    try {
      _categories.clear();
      _categories.addAll([
        CategoryModel(id: 1, name: 'Chinh tri', color: '#705335'),
        CategoryModel(id: 2, name: 'Thoi su', color: '#CFD3CD'),
        CategoryModel(id: 3, name: 'Kinh doanh', color: '#EFA94A'),
        CategoryModel(id: 4, name: 'The thao', color: '#8E402A'),
        CategoryModel(id: 5, name: 'Giai tri', color: '#F5D033'),
        CategoryModel(id: 6, name: 'The gioi', color: '#47402E'),
        CategoryModel(id: 7, name: 'Doi song', color: '#922B3E'),
        CategoryModel(id: 8, name: 'Giao duc', color: '#293133'),
        CategoryModel(id: 9, name: 'Suc khoe', color: '#EFA94A'),
        CategoryModel(id: 10, name: 'Thong tin', color: '#A03472'),
        CategoryModel(id: 11, name: 'Truyen thong', color: '#1E1E1E'),
        CategoryModel(id: 12, name: 'Phap luat', color: '#6C3B2A'),
        CategoryModel(id: 13, name: 'Xe', color: '#763C28'),
        CategoryModel(id: 14, name: 'Bat dong san', color: '#E55137'),
        CategoryModel(id: 15, name: 'Tai chinh', color: '#587246'),
      ]);

      await readSelectedId();
      return _categories;
    } catch (e) {
      return Future.error(Exception(e.toString()));
    }
  }

  Future<void> readSelectedId() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey('data_app')) {
        final String dataApp = prefs.getString('data_app') ?? '';
        if (dataApp.isNotEmpty) {
          Map<String, dynamic> map = jsonDecode(dataApp);

          _selectedId.clear();
          List<String> lstStr = map['selected'].toString().split('\$');
          _selectedId.addAll(lstStr.map((i) => int.parse(i)).toList());
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
        'data_app',
        jsonEncode({
          'selected': _selectedId.join('\$'),
        }),
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

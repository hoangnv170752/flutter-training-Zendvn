import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shoppingapp/model/category_model.dart';
import 'package:shoppingapp/model/product_model.dart';

class CategoryProvider extends ChangeNotifier {
  Future<List<Category>> getCategory() async {
    final url = 'http://apiforlearning.zendvn.com/api/mobile/categories';
    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(response.body);
      List<Category> data = List<Category>.from(
              jsonData.map((cate) => Category.fromJson(jsonEncode((cate)))))
          .toList();
      return data;
    } catch (e) {
      return Future.error(Exception("No data"));
    }
  }

  Future<List<Product>> getProductCategory(int id) async {
    final url =
        'http://apiforlearning.zendvn.com/api/mobile/categories/$id/products';
    final uri = Uri.parse(url);
    final finalUri = uri.replace(queryParameters: {"special": "true "});
    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(response.body);
      List<Product> data = List<Product>.from(
          jsonData.map((cate) => Product.fromJson(jsonEncode(cate))).toList());
      return data;
    } catch (e) {
      return Future.error(Exception("No data"));
    }
  }
}

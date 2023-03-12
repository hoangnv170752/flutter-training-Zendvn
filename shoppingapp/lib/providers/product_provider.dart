import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> productSpecial = [];

  Future<List<Product>> getProductSpecial() async {
    final url =
        'http://apiforlearning.zendvn.com/api/mobile/products?offset=0&sortBy=id&order=asc&special=true';
    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(response.body);
      List<Product> data = List<Product>.from(
              jsonData.map((product) => Product.fromJson(jsonEncode(product))))
          .toList();
      productSpecial = data;
      return data;
    } catch (e) {
      return Future.error(e);
    }
  }
}

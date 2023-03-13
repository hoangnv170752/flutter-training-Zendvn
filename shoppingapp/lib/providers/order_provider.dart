import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class OrderProvider extends ChangeNotifier {
  Future<bool> buy(Map<int, dynamic> items) async {
    const url = 'http://apiforlearning.zendvn.com/api/mobile/orders/save';
    final prefs = await SharedPreferences.getInstance();
    final userData = jsonDecode(prefs.getString('userData') ?? '');
    final token = userData['token'];
    var data = [];
    items.forEach((key, value) {
      data.add({
        "product_id": key,
        "quantity": value.quantity,
      });
    });
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Authorization': 'bearer $token',
        },
        body: jsonEncode(
          {"data": data},
        ),
      );
      print(data);
      if (response.statusCode != 201) {
        return false;
      }
      return true;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List> getListOrderCart() async {
    const url = "http://apiforlearning.zendvn.com/api/mobile/orders";
    final prefs = await SharedPreferences.getInstance();
    final userData = jsonDecode(prefs.getString('userData') ?? '');
    final token = userData['token'];
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'bearer $token',
        },
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      return [];
    } catch (e) {
      return Future.error(e);
    }
  }
}

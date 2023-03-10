import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shoppingapp/model/slider_model.dart';

class SliderProvider extends ChangeNotifier {
  Future<List<Sli>> getSlider() async {
    final url = 'http://apiforlearning.zendvn.com/api/mobile/sliders';
    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(response.body);
      List<Sli> data = List<Sli>.from(
              jsonData.map((slider) => Sli.fromJson(jsonEncode((slider)))))
          .toList();
      return data;
    } catch (e) {
      return Future.error(Exception("No data"));
    }
  }
}

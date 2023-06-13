import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:news_app/model/data_model.dart';
import 'package:provider/provider.dart';
import '../model/data_class.dart';

Future<List<DataModel>?> getCategory() async {
  List<DataModel>? data;
  try {
    final response = await http.get(
      Uri.parse(
          "http://apiforlearning.zendvn.com/api/categories_news?offset=0&limit=10&sort_by=id&sort_dir=asc"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> item = jsonDecode(response.body);
      data = List<DataModel>.from(item.map((data) => DataModel.fromJson(data)));
    } else {
      print("error");
    }
  } catch (e) {
    log(e.toString());
  }
  print(data);
  return data;
}

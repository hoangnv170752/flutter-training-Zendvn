import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/category_model.dart';

class CategoryRepository {
  static Future<List<CategoryModel>> getCategoriesNews() async {
    try {
      List<CategoryModel> rs = [];
      const String url = 'apiforlearning.zendvn.com';
      const String path = '/api/categories_news';
      final Map<String, dynamic> queryParameters = {
        'offset': '0',
        'limit': '20',
        'sortBy': 'id',
        'order': 'asc',
      };
      final Uri uri = Uri.https(url, path, queryParameters);

      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        final List<CategoryModel> lst = List<CategoryModel>.from(jsonData.map((data) => CategoryModel.fromMap(data)));
        rs.addAll(lst);
      } else {
        return Future.error(Exception('Can not get list category'));
      }

      return rs;
    } catch (e) {
      return Future.error(Exception(e.toString()));
    }
  }
}

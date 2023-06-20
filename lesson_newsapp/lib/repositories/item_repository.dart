import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lesson_newsapp/app/constant.dart';
import 'package:lesson_newsapp/models/article_model.dart';
import 'package:lesson_newsapp/models/category_model.dart';

class CategoryRepository {
  static Future<List<CategoryModel>> getCategories({int limit = 50}) async {
    try {
      List<CategoryModel> rs = [];
      const String path = '/api/categories_news';
      final Map<String, dynamic> queryParameters = {
        'offset': '0',
        'limit': '$limit',
        'sort_by': 'id',
        'sort_dir': 'asc',
      };
      final Uri uri = Uri.https(AppConstant.cDomain, path, queryParameters);
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        final List<CategoryModel> lst = List<CategoryModel>.from(
            jsonData.map((data) => CategoryModel.fromJson(data)));
        rs.addAll(lst);
      } else {
        return Future.error(Exception('Can not get list of category'));
      }
      return rs;
    } catch (e) {
      return Future.error(Exception(e.toString()));
    }
  }

  static Future<List<ArticleModel>> getArticles(int categoryID,
      {int offset = 0, int limit = 20}) async {
    try {
      List<ArticleModel> rs = [];
      final String path = '/api/categories_news/$categoryID/articles';
      final Map<String, dynamic> queryParameters = {
        'offset': '$offset',
        'limit': '$limit',
        'sort_by': 'id',
        'sort_dir': 'desc',
      };
      final Uri uri = Uri.https(AppConstant.cDomain, path, queryParameters);
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        final List<ArticleModel> lst = List<ArticleModel>.from(
            jsonData.map((data) => ArticleModel.fromJson(data)));
        rs.addAll(lst);
      } else {
        return Future.error(Exception('Can not get list article'));
      }
      return rs;
    } catch (e) {
      return Future.error(Exception(e.toString()));
    }
  }

  static Future<int> getTotalOfArticles(int categoryID) async {
    try {
      final String path = '/api/categories_news/$categoryID/articles/total';
      final Map<String, dynamic> queryParameters = {};
      final Uri uri = Uri.https(AppConstant.cDomain, path, queryParameters);
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        return int.parse(response.body);
      }
      return Future.error(Exception('Can not get list all article'));
    } catch (e) {
      return Future.error(Exception(e.toString()));
    }
  }
}

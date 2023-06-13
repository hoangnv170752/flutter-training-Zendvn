import 'package:flutter/material.dart';
import 'package:news_app/components/category/category.dart';
import 'package:news_app/components/search/search.dart';
import 'package:news_app/pages/HomePage.dart';

class AppHelper {
  static String get initialRoute => HomePage.routerName;

  static Map<String, Widget Function(BuildContext)> router(
      BuildContext context) {
    return {
      HomePage.routerName: (context) => const HomePage(),
      NewsSearchPage.routerName: (context) => const NewsSearchPage(),
      NewsCategory.routerName: (context) => const NewsCategory(),
    };
  }
}

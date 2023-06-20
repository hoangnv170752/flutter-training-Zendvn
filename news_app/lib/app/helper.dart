import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:news_app/page/favorite/favorite.dart';
import 'package:news_app/page/seen/seen.dart';
import 'package:provider/provider.dart';

import 'package:news_app/page/category/category.dart';
import 'package:news_app/page/home/home.dart';
import 'package:news_app/page/search/search.dart';
import 'package:news_app/provider/category_provider.dart';
import 'package:news_app/provider/theme_provider.dart';

class AppHelper {
  static String get initialRoute => HomePage.routerName;

  static Map<String, Widget Function(BuildContext)> router(
      BuildContext context) {
    return {
      HomePage.routerName: (context) => const HomePage(),
      SearchPage.routerName: (context) => const SearchPage(),
      CategoryPage.routerName: (context) => const CategoryPage(),
      SeenPage.routerName: (context) => const SeenPage(),
      FavoritePage.routerName: (context) => const FavoritePage(),
    };
  }

  static List<SingleChildWidget> get providers {
    return [
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => CategoryProvider()),
    ];
  }
}

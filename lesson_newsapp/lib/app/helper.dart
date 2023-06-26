import 'package:flutter/material.dart';
import 'package:lesson_newsapp/pages/category/category_page.dart';
import 'package:lesson_newsapp/pages/favorite/favorite.dart';
import 'package:lesson_newsapp/pages/home/home_page.dart';
import 'package:lesson_newsapp/pages/search/search_page.dart';
import 'package:lesson_newsapp/pages/wait/wait_screen.dart';
import 'package:lesson_newsapp/providers/item_provider.dart';
import 'package:nested/nested.dart';
import 'package:lesson_newsapp/pages/detail/detail_articles.dart';
import 'package:lesson_newsapp/pages/list/list_articles.dart';
import 'package:lesson_newsapp/pages/seen/seen.dart';
import 'package:provider/provider.dart';

class AppHelper {
  static String get initialRoute => WaitScreen.routerName;

  static Map<String, Widget Function(BuildContext)> router(
      BuildContext context) {
    return {
      WaitScreen.routerName: (context) => const WaitScreen(),
      HomePage.routerName: (context) => const HomePage(),
      SearchPage.routerName: (context) => const SearchPage(),
      CategoryPage.routerName: (context) => const CategoryPage(),
      SeenPage.routerName: (context) => const SeenPage(),
      FavoritePage.routerName: (context) => const FavoritePage(),
      ListArticlesPage.routerName: (context) => const ListArticlesPage(),
      DetailArticlePage.routerName: (context) => const DetailArticlePage(),
    };
  }

  static List<SingleChildWidget> get providers {
    return [
      ChangeNotifierProvider(create: (_) => CategoryProvider()),
    ];
  }
}

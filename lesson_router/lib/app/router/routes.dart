import 'package:demo1/app/router/router_name.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../pages/category_page.dart';
import '../../pages/home_page.dart';

class RouteCustom {
  static Route onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments as Map;

    switch (settings.name) {
      case RouterName.homePage:
        return MaterialPageRoute(builder: (context) {
          return const HomePage();
        });
      case RouterName.categoryPage:
        if (args['name'] != null) {
          return PageTransition(
            child: CategoryPage(
              name: args['name'],
            ),
            type: PageTransitionType.fade,
          );
        }
        return PageTransition(
          child: CategoryPage(),
          type: PageTransitionType.fade,
        );
      default:
        return MaterialPageRoute(builder: (context) {
          return Container(
            child: const Text('Error Router'),
          );
        });
    }
  }
}

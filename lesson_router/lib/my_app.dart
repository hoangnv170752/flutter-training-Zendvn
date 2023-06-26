import 'package:demo1/app/router/routes.dart';
import 'package:demo1/pages/category_page.dart';
import 'package:demo1/pages/home_page.dart';
import 'package:demo1/widget/bottom_tab.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomBar(),
      onGenerateRoute: RouteCustom.onGenerateRoute,
    );
  }
}

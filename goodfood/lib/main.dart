import 'package:flutter/material.dart';
import 'package:goodfood/config/const.dart';
import 'package:goodfood/pages/home/widget/category.dart';
import 'package:goodfood/pages/home/widget/product.dart';
import 'package:goodfood/pages/index.dart';
import 'package:goodfood/providers/category_provider.dart';
import 'package:goodfood/providers/product_provider.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ChangeNotifierProvider(create: (_) => ProductProvider()),
    ],
    child: MaterialApp(
      theme: ThemeData(backgroundColor: dColorMain),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        MyApp.routeName: ((context) => MyApp()),
        CategoryPage.routeName: ((context) => CategoryPage()),
        ProductPage.routeName: ((context) => ProductPage())
      },
  ),)
  );
}

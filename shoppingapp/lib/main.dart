import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/page/auth/auth_page.dart';
import 'package:shoppingapp/page/category/category.dart';
import 'package:shoppingapp/page/home/home.dart';
import 'package:shoppingapp/page/product/product.dart';
import 'package:shoppingapp/providers/auth_provider.dart';
import 'package:shoppingapp/providers/category_provider.dart';
import 'package:shoppingapp/providers/slider_provider.dart';

void main(List<String> args) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => SliderProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => CategoryProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => AuthProvider(),
      )
    ],
    child: Consumer<AuthProvider>(
      builder: (context, auth, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: auth.isAuth ? const HomePage() : AuthPage(),
          initialRoute: HomePage.routerName,
          routes: {
            HomePage.routerName: (context) => const HomePage(),
            CategoryPage.routeName: (context) => const CategoryPage(),
            ProductPage.routeName: (context) => const ProductPage(),
            AuthPage.routerName: (context) => AuthPage(),
          },
        );
      },
    ),
  ));
}

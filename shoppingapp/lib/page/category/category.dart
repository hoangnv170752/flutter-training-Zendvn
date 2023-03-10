import 'package:flutter/material.dart';
import 'package:shoppingapp/page/category/widget/category_body.dart';

class CategoryPage extends StatelessWidget {
  static const routeName = '/category';
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
        appBar: AppBar(
          title: Text(arg['name']),
          // ignore: deprecated_member_use
          backgroundColor: Theme.of(context).backgroundColor,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
                Color.fromARGB(255, 123, 201, 95),
                Colors.blue
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
          ),
        ),
        body: const CategoryBody());
  }
}

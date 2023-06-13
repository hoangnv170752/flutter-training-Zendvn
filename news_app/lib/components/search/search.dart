import 'package:flutter/material.dart';
import 'package:news_app/components/category/category.dart';
import 'package:news_app/components/search/widget/search_box.dart';

class NewsSearchPage extends StatelessWidget {
  const NewsSearchPage({super.key});

  static const String routerName = '/search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SearchBox(
              pressSuffix: () {
                Navigator.pushNamed(context, NewsCategory.routerName);
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lesson_newsapp/app/color.dart';
import 'package:lesson_newsapp/app/constant.dart';
import 'package:lesson_newsapp/models/article_model.dart';

class DetailArticlePage extends StatelessWidget {
  const DetailArticlePage({
    Key? key,
  }) : super(key: key);

  static const String routerName = '/detail_articles_page';

  @override
  Widget build(BuildContext context) {
    final Map<dynamic, dynamic> parms =
        (ModalRoute.of(context)?.settings.arguments ?? {})
            as Map<dynamic, dynamic>;
    ArticleModel article = parms['data'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.cPrimary,
        title: Text(
          article.title,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding:
              EdgeInsets.symmetric(horizontal: AppConstant.cDefaultPadding),
          child: Column(
            children: [
              Text(article.description),
            ],
          ),
        ),
      ),
    );
  }
}

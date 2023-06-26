import 'package:flutter/material.dart';
import 'package:lesson_newsapp/app/color.dart';
import 'package:lesson_newsapp/app/constant.dart';
import 'package:lesson_newsapp/models/article_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailArticlePage extends StatefulWidget {
  const DetailArticlePage({
    Key? key,
  }) : super(key: key);

  static const String routerName = '/detail_articles_page';

  @override
  State<DetailArticlePage> createState() => _DetailArticlePageState();
}

class _DetailArticlePageState extends State<DetailArticlePage> {
  late final WebViewController controller;

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
      // body: Center(
      //   child: SingleChildScrollView(
      //     padding:
      //         EdgeInsets.symmetric(horizontal: AppConstant.cDefaultPadding),
      //     child: Column(
      //       children: [
      //         Text(article.description),
      //       ],
      //     ),
      //   ),
      // ),
      body: WebViewWidget(
        controller: WebViewController()
          ..loadRequest(
            Uri.parse(article.link),
          ),
      ),
    );
  }
}

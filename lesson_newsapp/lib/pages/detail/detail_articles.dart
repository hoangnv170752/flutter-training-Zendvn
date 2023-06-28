import 'package:flutter/material.dart';
import 'package:lesson_newsapp/app/color.dart';
import 'package:lesson_newsapp/app/constant.dart';
import 'package:lesson_newsapp/models/article_model.dart';
import 'package:lesson_newsapp/providers/item_provider.dart';
import 'package:provider/provider.dart';
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
    // var product = Provider.of<ArticleModel>(context, listen: false);

    final Map<dynamic, dynamic> parms =
        (ModalRoute.of(context)?.settings.arguments ?? {})
            as Map<dynamic, dynamic>;
    ArticleModel article = parms['data'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.cPrimary,
        title: Text(
          article.title,
          style: TextStyle(
              fontSize: AppConstant.cTextHeaderSize,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          // Consumer<ArticleModel>(
          //   builder: (((context, value, child) {
          //     return InkWell(
          //       onTap: (() {
          //         value.toggleIsFavorite();
          //       }),
          //       child: Icon(
          //         Icons.favorite,
          //         size: AppConstant.cHeaderIconSize,
          //         color: Colors.red,
          //       ),
          //     );
          //   })),
          // ),
          InkWell(
            onTap: (() {}),
            child: Icon(
              Icons.favorite,
              size: AppConstant.cHeaderIconSize,
              color: Colors.red,
            ),
          )
        ],
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
      body: article.link != ''
          ? WebViewWidget(
              controller: WebViewController()
                ..loadRequest(
                  Uri.parse(article.link),
                ),
            )
          : Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstant.cDefaultPadding),
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

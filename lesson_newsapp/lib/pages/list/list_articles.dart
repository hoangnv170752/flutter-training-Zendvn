import 'package:flutter/material.dart';
import 'package:lesson_newsapp/app/color.dart';
import 'package:lesson_newsapp/app/constant.dart';
import 'package:lesson_newsapp/models/article_model.dart';
import 'package:lesson_newsapp/providers/item_provider.dart';
import 'package:lesson_newsapp/widget/item/item_card.dart';
import 'package:provider/provider.dart';

class ListArticlesPage extends StatefulWidget {
  const ListArticlesPage({super.key});

  static const String routerName = '/list_articles_page';

  @override
  State<ListArticlesPage> createState() => _ListArticlesPageState();
}

class _ListArticlesPageState extends State<ListArticlesPage> {
  Future<List<ArticleModel>>? futureArticle;
  final ScrollController scrollController = ScrollController();
  String? categoryName;
  final int limit = 5;
  int offset = 0;
  int categoryID = 0;
  bool isLoad = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Map<dynamic, dynamic> parms =
        (ModalRoute.of(context)?.settings.arguments ?? {})
            as Map<dynamic, dynamic>;
    categoryName = parms['categoryName'];
    categoryID = parms['categoryID'];
    futureArticle = context.read<CategoryProvider>().loadArticles(
          categoryID,
          offset: offset,
          limit: limit,
        );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.cPrimary,
        title: Text(categoryName ?? ''),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstant.cDefaultPadding,
          ),
          child: FutureBuilder<List<ArticleModel>>(
            future: futureArticle,
            initialData: const [],
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              if (!snapshot.hasData) {
                return const Center(child: Text('No data'));
              }
              List<ArticleModel> articles = snapshot.data ?? [];
              if (articles.isEmpty) {
                return const Center(child: Text('No data'));
              }
              return ListView.separated(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  if (index < articles.length) {
                    return ItemCard(article: articles[index]);
                  }
                  return const Center(child: CircularProgressIndicator());
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: size.height * 0.02);
                },
                itemCount: articles.length + 1,
              );
            },
          ),
        ),
      ),
    );
  }
}

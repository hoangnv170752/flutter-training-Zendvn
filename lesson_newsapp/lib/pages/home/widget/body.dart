// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lesson_newsapp/models/article_model.dart';
import 'package:lesson_newsapp/models/category_model.dart';
import 'package:lesson_newsapp/pages/list/list_articles.dart';
import 'package:lesson_newsapp/providers/item_provider.dart';
import 'package:lesson_newsapp/widget/item/item_card.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  final int categoryId;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CategoryModel? cate = context
        .read<CategoryProvider>()
        .categories
        .where((element) => element.id == categoryId)
        .firstOrNull;
    print(cate);
    return FutureBuilder<List<ArticleModel>>(
      future:
          context.read<CategoryProvider>().loadArticles(categoryId, limit: 4),
      initialData: const [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: size.height * 0.3,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasError) {
          return SizedBox(
            height: size.height * 0.3,
            child: Center(child: Text(snapshot.error.toString())),
          );
        }
        if (!snapshot.hasData) {
          return SizedBox(
            height: size.height * 0.3,
            child: const Center(child: Text('No data')),
          );
        }
        List<ArticleModel> articles = snapshot.data ?? [];
        if (articles.isEmpty) {
          return SizedBox(
            height: size.height * 0.3,
            child: const Center(child: Text('No data')),
          );
        }
        return Column(
          children: [
            SizedBox(height: size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    cate?.name ?? '',
                    style: Theme.of(context).textTheme.displayLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    alignment: Alignment.bottomCenter,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      ListArticlesPage.routerName,
                      arguments: {
                        'categoryID': categoryId,
                        'categoryName': cate?.name ?? '',
                      },
                    );
                  },
                  child: Text(
                    'View All',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.01),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ItemCard(article: articles[index]);
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: size.height * 0.02);
              },
              itemCount: articles.length,
            )
          ],
        );
      },
    );
  }
}

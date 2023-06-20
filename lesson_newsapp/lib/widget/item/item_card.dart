// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:lesson_newsapp/app/constant.dart';
import 'package:lesson_newsapp/models/article_model.dart';
import 'package:lesson_newsapp/pages/detail/detail_articles.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailArticlePage.routerName,
          arguments: {'data': article},
        );
      },
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      child: AspectRatio(
        aspectRatio: 3,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(article.thumb),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: EdgeInsets.only(
                    left: AppConstant.cDefaultPadding, right: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: Theme.of(context).textTheme.labelLarge,
                      maxLines: 1,
                    ),
                    Text(
                      article.description,
                      style: Theme.of(context).textTheme.labelMedium,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      DateFormat('dd-MM-yyyy').format(article.publish),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

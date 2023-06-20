// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:news_app/app/color.dart';
import 'package:news_app/common/item/item_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
    required this.categoryId,
    required this.categoryName,
  }) : super(key: key);

  final int categoryId;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(height: size.height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                categoryName,
                style: Theme.of(context).textTheme.labelLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              'View All',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(color: AppColor.kNewsActive),
            ),
          ],
        ),
        SizedBox(height: size.height * 0.01),
        ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return const ItemCard();
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: size.height * 0.02);
          },
          itemCount: 5,
        )
      ],
    );
  }
}

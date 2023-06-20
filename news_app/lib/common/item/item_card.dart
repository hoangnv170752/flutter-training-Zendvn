import 'package:flutter/material.dart';
import 'package:news_app/app/color.dart';
import 'package:news_app/app/constant.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('http://placeimg.com/640/480/city'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding:
                  EdgeInsets.only(left: AppConstant.kDefaultPadding, right: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Et et sit dicta qui dolore.',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: AppColor.kNewsActive),
                  ),
                  Text(
                    'Adipisci quaerat amet qui nostrum et aliquid.',
                    style: Theme.of(context).textTheme.labelSmall,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'ut-suscipit-cumque',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: AppColor.kBlue),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

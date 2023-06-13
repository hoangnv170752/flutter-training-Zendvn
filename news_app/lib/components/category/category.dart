import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NewsCategory extends StatelessWidget {
  const NewsCategory({Key? key}) : super(key: key);
  static const String routerName = '/category';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GridView.count(
          childAspectRatio: 4 / 2,
          primary: false,
          crossAxisCount: 2,
          children: List.generate(8, (index) {
            return Center(
              child: Container(
                padding: EdgeInsets.all(10),
                width: 160,
                decoration: BoxDecoration(
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'News $index',
                      style: Theme.of(context).textTheme.headlineSmall,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.check_box))
                  ],
                ),
              ),
            );
          })),
    );
  }
}

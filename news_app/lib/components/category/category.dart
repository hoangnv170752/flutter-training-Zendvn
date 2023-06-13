import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/model/data_class.dart';
import 'package:provider/provider.dart';

class NewsCategory extends StatefulWidget {
  const NewsCategory({Key? key}) : super(key: key);
  static const String routerName = '/category';

  @override
  State<NewsCategory> createState() => _NewsCategoryState();
}

class _NewsCategoryState extends State<NewsCategory> {
  @override
  void initState() {
    super.initState();
    final postModel = Provider.of<DataClass>(context, listen: false);
    postModel.getPostData();
  }

  @override
  Widget build(BuildContext context) {
    final category = Provider.of<DataClass>(context);
    print(category);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: !category.loading
          ? GridView.count(
              childAspectRatio: 4 / 2,
              primary: false,
              crossAxisCount: 2,
              children: List.generate(
                category.post.length,
                (index) {
                  return Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              category.post[index]!.name,
                              style: Theme.of(context).textTheme.headlineSmall,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.check_box),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          : Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }
}

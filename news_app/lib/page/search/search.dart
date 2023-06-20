import 'package:flutter/material.dart';
import 'package:news_app/app/constant.dart';
import 'package:news_app/common/item/item_card.dart';
import 'package:news_app/page/search/widget/search_box.dart';
import 'package:news_app/page/search/widget/search_list.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  static const String routerName = '/search_page';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SearchBox(),
              const SearchList(),
              ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: AppConstant.kDefaultPadding),
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
          ),
        ),
      ),
    );
  }
}

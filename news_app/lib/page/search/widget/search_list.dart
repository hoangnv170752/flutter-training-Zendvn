import 'package:flutter/material.dart';
import 'package:news_app/app/color.dart';
import 'package:news_app/app/constant.dart';

class SearchList extends StatefulWidget {
  const SearchList({super.key});

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  int selectedIndex = 0;
  List<String> categories = [
    'All',
    'praesentium',
    'qui-dicta-commodi',
    'temporibus',
    'cumque',
    'eos quis iste',
    'ratione-et-minus',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(
        left: AppConstant.kDefaultPadding,
        right: AppConstant.kDefaultPadding,
        bottom: AppConstant.kDefaultMargin,
      ),
      height: size.height * 0.04,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                left: index == 0 ? 0 : AppConstant.kDefaultPadding / 2,
                right: index == categories.length - 1 ? 0 : AppConstant.kDefaultPadding / 2,
              ),
              padding: EdgeInsets.symmetric(horizontal: AppConstant.kDefaultPadding),
              decoration: BoxDecoration(
                color: index == selectedIndex ? AppColor.kNewsActive : AppColor.kNewsInActive,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                categories[index],
                style: const TextStyle(color: Colors.black),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lesson_newsapp/app/color.dart';
import 'package:lesson_newsapp/app/constant.dart';
import 'package:lesson_newsapp/models/category_model.dart';
import 'package:lesson_newsapp/providers/item_provider.dart';
import 'package:provider/provider.dart';

class SearchList extends StatefulWidget {
  const SearchList({super.key});

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  int selectedIndex = 0;
  List<String> cats = [
    'All',
    'Sports',
    'Politics',
    'History',
    'Test 1',
    'Test 2',
    'Test 3',
  ];
  Future<List<CategoryModel>>? futureCategory;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    futureCategory = context.read<CategoryProvider>().loadCategory();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FutureBuilder<List<CategoryModel>>(
      future: futureCategory,
      initialData: const [],
      builder: (context, snapshot) {
        List<CategoryModel> categories = snapshot.data ?? [];
        return Container(
          margin: EdgeInsets.only(
            left: AppConstant.cDefaultPadding,
            right: AppConstant.cDefaultPadding,
            bottom: AppConstant.cDefaultMargin,
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
                    left: index == 0 ? 0 : AppConstant.cDefaultPadding / 2,
                    right: index == categories.length - 1
                        ? 0
                        : AppConstant.cDefaultPadding / 2,
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstant.cDefaultPadding),
                  decoration: BoxDecoration(
                    color: index == selectedIndex
                        ? AppColor.cMenuActive
                        : AppColor.cMenuInActive,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    categories[index].name,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

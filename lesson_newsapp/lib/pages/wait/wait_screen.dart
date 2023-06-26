import 'package:flutter/material.dart';
import 'package:lesson_newsapp/app/color.dart';
import 'package:lesson_newsapp/app/constant.dart';
import 'package:lesson_newsapp/app/theme.dart';
import 'package:lesson_newsapp/models/category_model.dart';
import 'package:lesson_newsapp/pages/category/category_page.dart';
import 'package:lesson_newsapp/pages/category/widget/select_box.dart';
import 'package:lesson_newsapp/pages/home/home_page.dart';
import 'package:lesson_newsapp/providers/item_provider.dart';
import 'package:provider/provider.dart';

class WaitScreen extends StatefulWidget {
  const WaitScreen({super.key});
  static const String routerName = '/wait_screen';

  @override
  State<WaitScreen> createState() => _WaitScreenState();
}

class _WaitScreenState extends State<WaitScreen> {
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
    return Scaffold(
      body: FutureBuilder<List<CategoryModel>>(
        future: futureCategory,
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
          List<CategoryModel> categories = snapshot.data ?? [];
          List<int> lstSelected = context.read<CategoryProvider>().selectedId;
          if (categories.isEmpty) {
            return const Center(child: Text('No data'));
          }
          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image(
                      image: AssetImage('assets/images/img02.png'),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: AppConstant.cDefaultPadding),
                      child: Text(
                        "Choose your favorite category!!",
                        style:
                            TextStyle(fontSize: 20, color: AppColor.cTextTitle),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SelectBox(
                          id: categories[index].id,
                          name: categories[index].name,
                          selected: lstSelected.contains(categories[index].id),
                        );
                      },
                      itemCount: categories.length,
                      padding: EdgeInsets.symmetric(
                          horizontal: AppConstant.cDefaultPadding),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: AppConstant.cDefaultPadding),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                HomePage.routerName,
                              );
                            },
                            child: Row(
                              children: [
                                Text(
                                  "Go to the Home page",
                                  style: TextStyle(color: AppColor.cBlue),
                                ),
                                Icon(
                                  Icons.home,
                                  color: AppColor.cBlue,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

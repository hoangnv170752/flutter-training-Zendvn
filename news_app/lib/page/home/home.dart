import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:news_app/app/color.dart';
import 'package:news_app/app/constant.dart';
import 'package:news_app/common/drawer/news_drawer.dart';
import 'package:news_app/page/home/widget/body.dart';
import 'package:news_app/page/home/widget/home_button.dart';
import 'package:news_app/page/search/search.dart';
import 'package:news_app/utilities/helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routerName = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AdvancedDrawerController _advancedDrawerController =
      AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    Helper.printof('HomePage::build');

    return AdvancedDrawer(
      controller: _advancedDrawerController,
      animationCurve: Curves.easeIn,
      animationDuration: const Duration(milliseconds: 300),
      openScale: 1,
      openRatio: 0.5,
      drawer: NewsDrawer(control: _advancedDrawerController),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leadingWidth: 50,
          leading: ValueListenableBuilder<AdvancedDrawerValue>(
            valueListenable: _advancedDrawerController,
            builder: (context, value, child) {
              Helper.printof('HomePage::AdvancedDrawerValue::build');

              return HomeButton(
                press: () {
                  _advancedDrawerController.toggleDrawer();
                },
                icon: value.visible ? Icons.menu : Icons.menu,
                color: value.visible
                    ? AppColor.kNewsInActive
                    : AppColor.kNewsActive,
              );
            },
          ),
          actions: [
            HomeButton(
              icon: Icons.search,
              color: AppColor.kNewsActive,
              press: () {
                Navigator.pushNamed(context, SearchPage.routerName);
              },
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstant.kDefaultPadding,
              ),
              child: const Column(
                children: [
                  HomeBody(categoryId: 1, categoryName: 'ABC'),
                  HomeBody(categoryId: 2, categoryName: 'XYZ'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

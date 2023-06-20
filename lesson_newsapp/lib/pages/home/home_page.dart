import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:lesson_newsapp/app/color.dart';
import 'package:lesson_newsapp/app/constant.dart';
import 'package:lesson_newsapp/pages/home/widget/body.dart';
import 'package:lesson_newsapp/pages/home/widget/button.dart';
import 'package:lesson_newsapp/pages/search/search_page.dart';
import 'package:lesson_newsapp/providers/item_provider.dart';
import 'package:lesson_newsapp/widget/drawer/news_drawer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routerName = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AdvancedDrawerController _advancedDrawerController =
      AdvancedDrawerController();
  Future<List<int>>? futureSelected;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    futureSelected = context.watch<CategoryProvider>().loadSelected();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      controller: _advancedDrawerController,
      animationCurve: Curves.easeIn,
      animationDuration: const Duration(milliseconds: 300),
      openScale: 1,
      drawer: NewsDrawer(control: _advancedDrawerController),
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 80,
          leading: ValueListenableBuilder<AdvancedDrawerValue>(
            valueListenable: _advancedDrawerController,
            builder: (context, value, child) {
              return HomeButton(
                press: () {
                  _advancedDrawerController.toggleDrawer();
                },
                icon: value.visible ? Icons.menu : Icons.menu,
                color: value.visible
                    ? AppColor.cMenuInActive
                    : AppColor.cMenuActive,
              );
            },
          ),
          actions: [
            HomeButton(
              icon: Icons.search,
              color: AppColor.cMenuActive,
              press: () {
                Navigator.pushNamed(context, SearchPage.routerName);
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding:
                  EdgeInsets.symmetric(horizontal: AppConstant.cDefaultPadding),
              child: FutureBuilder<List<int>>(
                future: futureSelected,
                initialData: const [],
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  if (!snapshot.hasData) {
                    return const Text('No data');
                  }
                  List<int> lstSelected = snapshot.data ?? [];
                  if (lstSelected.isEmpty) {
                    return const Text('Chọn danh mục để đọc tin tức');
                  }
                  return Column(
                    children: List.generate(lstSelected.length, (index) {
                      return HomeBody(categoryId: lstSelected[index]);
                    }),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

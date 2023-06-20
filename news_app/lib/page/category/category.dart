import 'package:flutter/material.dart';
import 'package:news_app/app/constant.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/page/category/widget/select_box.dart';
import 'package:news_app/provider/category_provider.dart';
import 'package:news_app/utilities/helper.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  static const String routerName = '/category_page';

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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
    Helper.printof('CategoryPage::build');

    return Scaffold(
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
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

          Helper.printof('CategoryPage::FutureBuilder::build');

          return SafeArea(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: AppConstant.kDefaultPadding,
                mainAxisSpacing: AppConstant.kDefaultPadding,
                crossAxisCount: 2,
                childAspectRatio: 3.5,
              ),
              itemBuilder: (context, index) {
                return SelectBox(
                  id: categories[index].id,
                  name: categories[index].name,
                  selected: lstSelected.contains(categories[index].id),
                );
              },
              itemCount: categories.length,
              padding:
                  EdgeInsets.symmetric(horizontal: AppConstant.kDefaultPadding),
            ),
          );
        },
      ),
    );
  }
}

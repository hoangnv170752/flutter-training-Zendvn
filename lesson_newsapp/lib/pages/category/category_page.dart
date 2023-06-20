import 'package:flutter/material.dart';
import 'package:lesson_newsapp/app/constant.dart';
import 'package:lesson_newsapp/models/category_model.dart';
import 'package:lesson_newsapp/pages/category/widget/select_box.dart';
import 'package:lesson_newsapp/providers/item_provider.dart';
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
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(),
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
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: AppConstant.cDefaultPadding,
                mainAxisSpacing: AppConstant.cDefaultPadding,
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
                  EdgeInsets.symmetric(horizontal: AppConstant.cDefaultPadding),
            ),
          );
        },
      ),
    );
  }
}

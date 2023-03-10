import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/page/category/category.dart';
import 'package:shoppingapp/providers/category_provider.dart';

class HomeCategory extends StatefulWidget {
  const HomeCategory({super.key});

  @override
  State<HomeCategory> createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  late Future categoryFutute;
  @override
  void didChangeDependencies() {
    categoryFutute = Provider.of<CategoryProvider>(context).getCategory();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: categoryFutute,
      initialData: [],
      builder: (context, asyncData) {
        var catData = [];
        if (asyncData.hasData) {
          catData = asyncData.data! as List;
        } else {
          return Container(
            child: Text("No Data Available"),
          );
        }
        return SizedBox(
            height: 70,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, CategoryPage.routeName,
                        arguments: {
                          'id': catData[index].id,
                          'name': catData[index].name,
                        });
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                          boxShadow: const [],
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 255, 255, 255),
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: NetworkImage(catData[index].image)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      Text(catData[index].name)
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 20,
                  width: 10,
                );
              },
              itemCount: catData.length,
            ));
      },
    );
  }
}

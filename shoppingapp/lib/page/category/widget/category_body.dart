import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/page/product/product.dart';
import 'package:shoppingapp/providers/category_provider.dart';

class CategoryBody extends StatefulWidget {
  const CategoryBody({Key? key}) : super(key: key);

  @override
  State<CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  late Future productInCategoryFuture;
  @override
  void didChangeDependencies() {
    final Map<String, dynamic> arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    productInCategoryFuture =
        Provider.of<CategoryProvider>(context).getProductCategory(arg['id']);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        initialData: [],
        future: productInCategoryFuture,
        builder: (context, asyncData) {
          List data = [];
          if (asyncData.hasData) {
            data = asyncData.data as List;
          }
          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3 / 4,
            ),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    ProductPage.routeName,
                    arguments: {"data": data[index]},
                  );
                },
                child: GridTile(
                  footer: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(20)),
                    child: GridTileBar(
                      backgroundColor: Colors.black,
                      title: Text(data[index].name),
                      subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data[index].summary),
                            SizedBox(
                              height: 4,
                            ),
                            Text(data[index].price.toString(),
                                style: TextStyle(
                                    color: Colors.yellow, fontSize: 16)),
                          ]),
                      trailing: Icon(Icons.shopping_cart),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(data[index].image))),
                  ),
                ),
              );
            },
          );
        });
  }
}

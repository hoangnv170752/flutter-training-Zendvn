import 'package:flutter/material.dart';
import 'package:goodfood/config/const.dart';
import 'package:goodfood/providers/product_provider.dart';
import 'package:provider/provider.dart';


class CategoryPage extends StatelessWidget {
  static const routeName = '/category';
  CategoryPage({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;
    var products = Provider.of<ProductProvider>(context).getItemsWithCategoryId(data['categoryId']);
    print(products.length);
    print(data['categoryId']);

    return Scaffold(
      appBar: AppBar(
        title: Text(data['title']),
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[Color.fromARGB(255, 123, 201, 95), Colors.blue],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            ),
          ),
        ),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(15),
          itemCount: products.length,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 20);
          },
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: (() {
                Navigator.pop(context);
              }),
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                //color: Colors.amber,
                width: double.infinity,
                height: 200,
                child: GridTile(
                  footer: GridTileBar(
                    backgroundColor: dColorFooterImage,
                    title: Text(
                      products[index].title,
                      style: styleTitleItem,
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                            Icons.favorite,
                            size: sizeIconButton,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                            products[index].favorite,
                            style: styleTitleCardItem ,
                        ),
                        Icon(
                            Icons.timelapse_sharp,
                            size: sizeIconButton,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                            products[index].view,
                            style: styleTitleCardItem ,
                        )
                    ],),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(products[index].image, fit: BoxFit.cover,)
                  ),
                ),
              ),
            );
          },
      ),
    );
  }
}

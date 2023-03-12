import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/providers/cart_provider.dart';
import 'package:shoppingapp/providers/category_provider.dart';
import 'package:shoppingapp/providers/product_provider.dart';
import 'package:intl/intl.dart' as intl;

class ListProductSpecial extends StatelessWidget {
  const ListProductSpecial({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: FutureBuilder(
        future: Provider.of<ProductProvider>(context).getProductSpecial(),
        initialData: [],
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var data = snapshot.data! as List;
          return snapshot.hasData
              ? ListView.separated(
                  itemBuilder: ((context, index) {
                    return ListTile(
                      leading: Image(
                        image: NetworkImage('${data[index].image}'),
                        fit: BoxFit.fill,
                      ),
                      title: Text(
                        '${data[index].name}',
                        maxLines: 2,
                      ),
                      subtitle: Text(
                        intl.NumberFormat.simpleCurrency(
                                locale: 'vi', decimalDigits: 0)
                            .format(data[index].price),
                      ),
                      trailing: InkWell(
                          onTap: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .addCart(
                              data[index].id,
                              data[index].image,
                              data[index].name,
                              data[index].price,
                            );
                          },
                          child: Icon(Icons.shopping_cart_checkout)),
                    );
                  }),
                  separatorBuilder: ((context, index) {
                    return Divider(
                      height: 1,
                    );
                  }),
                  itemCount: data.length,
                )
              : Center(
                  child: Text('Empty Product'),
                );
        },
      ),
    );
  }
}

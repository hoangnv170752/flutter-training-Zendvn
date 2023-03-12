import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';
import 'package:shoppingapp/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  static final routeName = '/cart';
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Trang giỏ hàng'),
          backgroundColor: Theme.of(context).backgroundColor,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
                Color.fromARGB(255, 123, 201, 95),
                Colors.blue
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Consumer<CartProvider>(builder: (context, value, child) {
                var dataItem = value.items.values.toList();
                return ListView.separated(
                  itemBuilder: ((context, index) {
                    return ListTile(
                      leading: Image(
                        image: NetworkImage('${dataItem[index].image}'),
                        fit: BoxFit.fill,
                      ),
                      title: Text('${dataItem[index].name}'),
                      subtitle: Text(
                        intl.NumberFormat.simpleCurrency(
                                locale: 'vi', decimalDigits: 0)
                            .format(dataItem[index].price),
                      ),
                      trailing: SizedBox(
                        width: MediaQuery.of(context).size.width / 4,
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .decrease(
                                          value.items.keys.toList()[index]);
                                },
                                child: Icon(Icons.remove)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                '${dataItem[index].quantity}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .increase(
                                          value.items.keys.toList()[index]);
                                },
                                child: Icon(Icons.add)),
                          ],
                        ),
                      ),
                    );
                  }),
                  separatorBuilder: ((context, index) {
                    return Divider();
                  }),
                  itemCount: value.items.length,
                );
              }),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 88,
                  child: ElevatedButton(
                    child: Text('Mua hàng'),
                    onPressed: () {},
                  ),
                )),
          ],
        ));
  }
}

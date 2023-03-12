import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../model/product_model.dart';
import '../../providers/order_provider.dart';
import '../../providers/product_provider.dart';

class ListOrder extends StatefulWidget {
  static const routerName = '/listOder';
  const ListOrder({super.key});

  @override
  State<ListOrder> createState() => _ListOrderState();
}

class _ListOrderState extends State<ListOrder> {
  final bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách đơn hàng'),
        backgroundColor: Theme.of(context).backgroundColor,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[Color.fromARGB(255, 123, 201, 95), Colors.blue],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<OrderProvider>(context).getListOrderCart(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          var data = snapshot.data as List;
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    var dataItem = data[index]['order_items'] as List;
                    return ExpansionTile(
                        title: Text('Mã đơn hàng : ${data[index]['code']}'),
                        subtitle: Text(
                          DateFormat('kk:mm - dd-MM-yyyy ').format(
                            DateTime.parse(
                              data[index]['created_at'],
                            ),
                          ),
                        ),
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: dataItem.length,
                            itemBuilder: ((context, index) {
                              return FutureBuilder(
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const CircularProgressIndicator();
                                  }
                                  var item = snapshot.data as Product;
                                  return ListTile(
                                    leading: Image.network(item.image),
                                    title: Text(item.name),
                                  );
                                },
                                future: Provider.of<ProductProvider>(context,
                                        listen: false)
                                    .getProductById(
                                        dataItem[index]['product_id']),
                              );
                            }),
                          ),
                        ]);
                  },
                )
              : Container(
                  child: SvgPicture.asset('assets/images/svg/no-data.svg'),
                );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  static const routeName = '/product';
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;
    final product = data['data'];
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            snap: false,
            floating: false,
            expandedHeight: 400.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(product.name),
              background: Padding(
                padding: const EdgeInsets.all(60),
                child: Image(
                  fit: BoxFit.contain,
                  image: NetworkImage(product.image),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              child: Column(children: [
                Text(
                  product.description,
                  maxLines: 10,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.remove,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text('1'),
                    SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(Icons.add),
                    ),
                  ],
                )
              ]),
            ),
          )
        ],
      ),
      persistentFooterButtons: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: Text('Thêm sản phẩm'),
              onPressed: () {},
            ),
          ),
        )
      ],
    );
  }
}

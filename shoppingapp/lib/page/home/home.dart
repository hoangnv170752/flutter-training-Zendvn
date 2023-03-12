import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/page/home/widget/homecategory.dart';
import 'package:shoppingapp/page/home/widget/homeslider.dart';
import 'package:shoppingapp/page/home/widget/list_product_special.dart';
import 'package:shoppingapp/providers/auth_provider.dart';
import 'package:shoppingapp/providers/cart_provider.dart';
import '../auth/auth_page.dart';
import '../cart/cart.dart';

class HomePage extends StatelessWidget {
  static const routerName = '/';
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, child) {
        return auth.isAuth
            ? Home()
            : FutureBuilder(
                future: auth.autoLogin(),
                initialData: false,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return snapshot.data ? Home() : AuthPage();
                },
              );
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            children: [
              SizedBox(
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 500,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.home),
                          title: const Text("Trang chủ"),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              HomePage.routerName,
                            );
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.logout),
                          title: const Text("Đăng xuất"),
                          onTap: () {
                            Provider.of<AuthProvider>(context, listen: false)
                                .logout();
                          },
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Trang chủ'),
        backgroundColor: Theme.of(context).backgroundColor,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[Color.fromARGB(255, 123, 201, 95), Colors.blue],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Consumer<CartProvider>(
              builder: (context, value, child) {
                return badges.Badge(
                  badgeContent: Text('${value.items.length}'),
                  position: BadgePosition.topEnd(top: 0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, CartPage.routeName);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Icon(
                        Icons.shopping_cart,
                        size: 30,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          HomeSlider(),
          SizedBox(
            height: 10,
            width: 10,
          ),
          Row(children: [
            SizedBox(
              width: 20,
            ),
            Container(
              child: Text(
                'Danh mục sản phẩm',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(
              width: 70,
            ),
            Container(
              child: Text(
                'Tất cả (4)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ]),
          SizedBox(
            height: 20,
          ),
          HomeCategory(),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sản phẩm đặc biệt',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListProductSpecial(),
        ],
      ),
    );
  }
}

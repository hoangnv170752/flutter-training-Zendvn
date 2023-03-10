import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/page/home/widget/homecategory.dart';
import 'package:shoppingapp/page/home/widget/homeslider.dart';
import 'package:shoppingapp/providers/auth_provider.dart';
import '../auth/auth_page.dart';

class HomePage extends StatelessWidget {
  static const routerName = '/';
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, child) {
        return !auth.isAuth ? AuthPage() : const Home();
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
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
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shoppingapp/page/home/widget/homeslider.dart';

class HomePage extends StatelessWidget {
  static const routerName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(children: [HomeSlider()]),
    );
  }
}

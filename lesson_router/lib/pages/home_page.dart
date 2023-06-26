import 'package:demo1/app/router/router_name.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouterName.categoryPage,
                    arguments: {"name": "mua hang"});
              },
              child: const Text('MUA HANG'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouterName.categoryPage,
                    arguments: {"name": "san pham"});
              },
              child: const Text('DANH SACH'),
            ),
          ],
        ),
      ),
    );
  }
}

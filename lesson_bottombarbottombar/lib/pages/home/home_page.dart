import 'package:flutter/material.dart';
import 'package:lop/pages/buy/buy_page.dart';
import 'package:lop/pages/demo/demo_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const BuyPage();
                    },
                  ),
                );
              },
              child: const Text('Change Page Buy'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const DemoPage();
                    },
                  ),
                );
              },
              child: const Text('Change Page Show Demo'),
            ),
          ],
        ),
      ),
    );
  }
}

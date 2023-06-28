import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final name;
  const CategoryPage({super.key, this.name = "Danh sach"});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Stack(
        children: [
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(name.toString()),
          //     const SizedBox(
          //       height: 20,
          //     ),
          //     Center(
          //       child: ElevatedButton(
          //         onPressed: () {
          //           Navigator.pop(context);
          //         },
          //         child: const Text('Back Category'),
          //       ),
          //     ),
          //   ],
          // ),
          Center(
            child: Text(
              "Danh sach ${name}",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Danh sach',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}

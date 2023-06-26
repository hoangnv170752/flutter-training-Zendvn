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
          Positioned(
            top: 60,
            left: 20,
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_circle_left)),
          ),
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
    );
  }
}

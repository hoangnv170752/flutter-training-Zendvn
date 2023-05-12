import 'package:flutter/material.dart';

class BT02 extends StatelessWidget {
  const BT02({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "ZendVN",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            Text(
              "Study Flutter",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.menu, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            width: double.infinity,
            height: 200.0,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.0),
              ),
              color: Colors.transparent,
            ),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 106, 176, 250),
                  ], // Gradient from https://learnui.design/tools/gradient-generator.html
                  tileMode: TileMode.mirror,
                ),
              ),
            ),
          ),
          // ignore: sized_box_for_whitespace
          Container(
            height: 220,
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.all(15.0),
                  width: double.infinity,
                  // ignore: prefer_const_constructors
                  child: Row(
                    children: const [
                      Text(
                        "Categories",
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 230,
                      ),
                      Text(
                        "More...",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  height: 180,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        width: 150,
                        height: 10,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Color.fromARGB(255, 255, 255, 255),
                              Color.fromARGB(255, 106, 176, 250),
                            ], // Gradient from https://learnui.design/tools/gradient-generator.html
                            tileMode: TileMode.mirror,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        width: 150,
                        height: 400,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Color.fromARGB(255, 255, 255, 255),
                              Color.fromARGB(255, 106, 176, 250),
                            ], // Gradient from https://learnui.design/tools/gradient-generator.html
                            tileMode: TileMode.mirror,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        width: 150,
                        height: 400,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Color.fromARGB(255, 255, 255, 255),
                              Color.fromARGB(255, 106, 176, 250),
                            ], // Gradient from https://learnui.design/tools/gradient-generator.html
                            tileMode: TileMode.mirror,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // ignore: sized_box_for_whitespace
          Container(
            height: 230,
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.all(15.0),
                  width: double.infinity,
                  // ignore: prefer_const_constructors
                  child: Row(
                    children: const [
                      Text(
                        "News",
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 270,
                      ),
                      Text(
                        "More...",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  height: 180,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        width: 150,
                        height: 400,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Color.fromARGB(255, 255, 255, 255),
                              Color.fromARGB(255, 106, 176, 250),
                            ], // Gradient from https://learnui.design/tools/gradient-generator.html
                            tileMode: TileMode.mirror,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        width: 150,
                        height: 400,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Color.fromARGB(255, 255, 255, 255),
                              Color.fromARGB(255, 106, 176, 250),
                            ], // Gradient from https://learnui.design/tools/gradient-generator.html
                            tileMode: TileMode.mirror,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        width: 150,
                        height: 400,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Color.fromARGB(255, 255, 255, 255),
                              Color.fromARGB(255, 106, 176, 250),
                            ], // Gradient from https://learnui.design/tools/gradient-generator.html
                            tileMode: TileMode.mirror,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

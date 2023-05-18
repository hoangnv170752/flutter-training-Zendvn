import 'package:flutter/material.dart';

class Bt04 extends StatefulWidget {
  const Bt04({super.key});

  @override
  State<Bt04> createState() => _Bt04State();
}

class _Bt04State extends State<Bt04> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 222, 222),
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 300.0,
              height: 300.0,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  color: Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 189, 189, 189),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(10, 10),
                    ),
                  ]),
              child: Row(
                children: [
                  Container(
                    width: 70.0,
                    height: 70.0,
                    alignment: Alignment.topRight,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(90.0),
                      ),
                      color: Color.fromARGB(255, 208, 85, 85),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "David Grant",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "3D Artist",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Dicki - McDermott Dicki - McDermot",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

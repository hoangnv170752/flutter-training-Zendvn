import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Bt02 extends StatelessWidget {
  const Bt02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0.0,
        centerTitle: false,
        title: Text(
          'TODOLIST-APP',
          style: TextStyle(
            color: Color.fromARGB(255, 87, 87, 87),
            fontSize: 25,
            fontFamily: 'DancingScript',
          ),
        ),
        actions: [
          Container(
            height: 50,
            width: 120,
            child: Center(
              child: Text(
                "Add Task",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'DancingScript',
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Color.fromARGB(255, 255, 147, 117),
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 20,
              top: 10,
            ),
            child: Text(
              "Daily task",
              style: TextStyle(
                fontSize: 23,
                fontFamily: 'DancingScript',
              ),
            ),
          ),
          Expanded(
            child: Container(),
            flex: 1,
          ),
          Expanded(
            flex: 10,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    50,
                  ),
                ),
                color: Color.fromARGB(255, 255, 205, 193),
              ),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: 60,
                          left: 30,
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 180,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    40,
                                  ),
                                ),
                                color: Color.fromARGB(255, 253, 134, 104),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF000000).withAlpha(60),
                                    blurRadius: 6.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(
                                      0.0,
                                      3.0,
                                    ),
                                  ),
                                ],
                              ),
                              child: RotatedBox(
                                quarterTurns: -1,
                                child: Center(
                                  child: Text(
                                    'Study',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'DancingScript',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 22,
                            ),
                            Container(
                              height: 180,
                              width: 240,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  topRight: Radius.circular(40),
                                  bottomRight: Radius.circular(40),
                                ),
                                color: Color.fromARGB(255, 253, 134, 104),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF000000).withAlpha(60),
                                    blurRadius: 6.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(
                                      0.0,
                                      3.0,
                                    ),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 220,
                                    padding: EdgeInsets.only(
                                      left: 20,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 167, 145),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(
                                          40,
                                        ),
                                        bottomRight: Radius.circular(
                                          40,
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Hoc tap va lam viec",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "DancingScript",
                                            fontSize: 25,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "8 AM - 1 PM",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontFamily: "DancingScript",
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Minima sed voluptatem aliquid sed consequatur. Excepturi sunt in et odit sed. Doloremque quis inventore in voluptatibus aut aspernatur.",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 19,
                                          ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: 60,
                          left: 30,
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 180,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    40,
                                  ),
                                ),
                                color: Color.fromARGB(255, 130, 240, 75),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF000000).withAlpha(60),
                                    blurRadius: 6.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(
                                      0.0,
                                      3.0,
                                    ),
                                  ),
                                ],
                              ),
                              child: RotatedBox(
                                quarterTurns: -1,
                                child: Center(
                                  child: Text(
                                    'Study',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'DancingScript',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 22,
                            ),
                            Container(
                              height: 180,
                              width: 240,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  topRight: Radius.circular(40),
                                  bottomRight: Radius.circular(40),
                                ),
                                color: Color.fromARGB(255, 130, 240, 75),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF000000).withAlpha(60),
                                    blurRadius: 6.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(
                                      0.0,
                                      3.0,
                                    ),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 220,
                                    padding: EdgeInsets.only(
                                      left: 20,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 195, 255, 164),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(
                                          40,
                                        ),
                                        bottomRight: Radius.circular(
                                          40,
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Hoc tap va lam viec",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "DancingScript",
                                            fontSize: 25,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "8 AM - 1 PM",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontFamily: "DancingScript",
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Minima sed voluptatem aliquid sed consequatur. Excepturi sunt in et odit sed. Doloremque quis inventore in voluptatibus aut aspernatur.",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 19,
                                          ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: 60,
                          left: 30,
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 180,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    40,
                                  ),
                                ),
                                color: Color.fromARGB(255, 255, 121, 222),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF000000).withAlpha(60),
                                    blurRadius: 6.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(
                                      0.0,
                                      3.0,
                                    ),
                                  ),
                                ],
                              ),
                              child: RotatedBox(
                                quarterTurns: -1,
                                child: Center(
                                  child: Text(
                                    'Study',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'DancingScript',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 22,
                            ),
                            Container(
                              height: 180,
                              width: 240,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  topRight: Radius.circular(40),
                                  bottomRight: Radius.circular(40),
                                ),
                                color: Color.fromARGB(255, 255, 121, 222),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF000000).withAlpha(60),
                                    blurRadius: 6.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(
                                      0.0,
                                      3.0,
                                    ),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 220,
                                    padding: EdgeInsets.only(
                                      left: 20,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 168, 233),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(
                                          40,
                                        ),
                                        bottomRight: Radius.circular(
                                          40,
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Hoc tap va lam viec",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "DancingScript",
                                            fontSize: 25,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "8 AM - 1 PM",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontFamily: "DancingScript",
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Minima sed voluptatem aliquid sed consequatur. Excepturi sunt in et odit sed. Doloremque quis inventore in voluptatibus aut aspernatur.",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 19,
                                          ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

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
        title: const Text(
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
            child: const Center(
              child: Text(
                "Add Task",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'DancingScript',
                ),
              ),
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Color.fromARGB(255, 255, 183, 163),
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              top: 10,
            ),
            child: const Text(
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
              decoration: const BoxDecoration(
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
                        padding: const EdgeInsets.only(
                          top: 60,
                          left: 30,
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 180,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    40,
                                  ),
                                ),
                                color: const Color.fromARGB(255, 253, 134, 104),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        const Color(0xFF000000).withAlpha(60),
                                    blurRadius: 6.0,
                                    spreadRadius: 0.0,
                                    offset: const Offset(
                                      0.0,
                                      3.0,
                                    ),
                                  ),
                                ],
                              ),
                              child: const RotatedBox(
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
                            const SizedBox(
                              width: 22,
                            ),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  height: 180,
                                  width: 240,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                      topRight: Radius.circular(40),
                                      bottomRight: Radius.circular(40),
                                    ),
                                    color: const Color.fromARGB(
                                        255, 253, 134, 104),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xFF000000)
                                            .withAlpha(60),
                                        blurRadius: 6.0,
                                        spreadRadius: 0.0,
                                        offset: const Offset(
                                          0.0,
                                          3.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        width: 220,
                                        padding: const EdgeInsets.only(
                                          left: 20,
                                        ),
                                        decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 255, 167, 145),
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
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              "Hoc tap va lam viec",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "DancingScript",
                                                fontSize: 25,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              "8 AM - 1 PM",
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontFamily: "DancingScript",
                                                fontSize: 20,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
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
                                      const SizedBox(
                                        height: 150,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Positioned(
                                  bottom: -10.0,
                                  right: 0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: const Icon(
                                            Icons.workspace_premium,
                                            size: 28,
                                            color: Color(0xffE29833),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: const Icon(
                                            Icons.browse_gallery,
                                            size: 28,
                                            color: Color.fromARGB(
                                                255, 251, 234, 108),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: const Icon(
                                            Icons.edit_note,
                                            size: 28,
                                            color: Color.fromARGB(
                                                255, 94, 232, 117),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: const Icon(
                                            Icons.delete_forever,
                                            size: 28,
                                            color: Color.fromARGB(
                                                255, 49, 43, 230),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
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
                        padding: const EdgeInsets.only(
                          top: 60,
                          left: 30,
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 180,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    40,
                                  ),
                                ),
                                color: const Color.fromARGB(255, 130, 240, 75),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        const Color(0xFF000000).withAlpha(60),
                                    blurRadius: 6.0,
                                    spreadRadius: 0.0,
                                    offset: const Offset(
                                      0.0,
                                      3.0,
                                    ),
                                  ),
                                ],
                              ),
                              child: const RotatedBox(
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
                            const SizedBox(
                              width: 22,
                            ),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  height: 180,
                                  width: 240,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                      topRight: Radius.circular(40),
                                      bottomRight: Radius.circular(40),
                                    ),
                                    color:
                                        const Color.fromARGB(255, 130, 240, 75),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xFF000000)
                                            .withAlpha(60),
                                        blurRadius: 6.0,
                                        spreadRadius: 0.0,
                                        offset: const Offset(
                                          0.0,
                                          3.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        width: 220,
                                        padding: const EdgeInsets.only(
                                          left: 20,
                                        ),
                                        decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 182, 255, 145),
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
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              "Hoc tap va lam viec",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "DancingScript",
                                                fontSize: 25,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              "8 AM - 1 PM",
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontFamily: "DancingScript",
                                                fontSize: 20,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
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
                                      const SizedBox(
                                        height: 150,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Positioned(
                                  bottom: -10.0,
                                  right: 0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: const Icon(
                                            Icons.workspace_premium,
                                            size: 28,
                                            color: Color(0xffE29833),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: const Icon(
                                            Icons.browse_gallery,
                                            size: 28,
                                            color: Color.fromARGB(
                                                255, 251, 234, 108),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: const Icon(
                                            Icons.edit_note,
                                            size: 28,
                                            color: Color.fromARGB(
                                                255, 94, 232, 117),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: const Icon(
                                            Icons.delete_forever,
                                            size: 28,
                                            color: Color.fromARGB(
                                                255, 49, 43, 230),
                                          ),
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
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          top: 60,
                          left: 30,
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 180,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    40,
                                  ),
                                ),
                                color: Color.fromARGB(255, 240, 75, 240),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        const Color(0xFF000000).withAlpha(60),
                                    blurRadius: 6.0,
                                    spreadRadius: 0.0,
                                    offset: const Offset(
                                      0.0,
                                      3.0,
                                    ),
                                  ),
                                ],
                              ),
                              child: const RotatedBox(
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
                            const SizedBox(
                              width: 22,
                            ),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  height: 180,
                                  width: 240,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                      topRight: Radius.circular(40),
                                      bottomRight: Radius.circular(40),
                                    ),
                                    color: Color.fromARGB(255, 240, 75, 240),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xFF000000)
                                            .withAlpha(60),
                                        blurRadius: 6.0,
                                        spreadRadius: 0.0,
                                        offset: const Offset(
                                          0.0,
                                          3.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        width: 220,
                                        padding: const EdgeInsets.only(
                                          left: 20,
                                        ),
                                        decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 255, 129, 255),
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
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              "Hoc tap va lam viec",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "DancingScript",
                                                fontSize: 25,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              "8 AM - 1 PM",
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontFamily: "DancingScript",
                                                fontSize: 20,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
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
                                      const SizedBox(
                                        height: 150,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Positioned(
                                  bottom: -10.0,
                                  right: 0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: const Icon(
                                            Icons.workspace_premium,
                                            size: 28,
                                            color: Color(0xffE29833),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: const Icon(
                                            Icons.browse_gallery,
                                            size: 28,
                                            color: Color.fromARGB(
                                                255, 251, 234, 108),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: const Icon(
                                            Icons.edit_note,
                                            size: 28,
                                            color: Color.fromARGB(
                                                255, 94, 232, 117),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: const Icon(
                                            Icons.delete_forever,
                                            size: 28,
                                            color: Color.fromARGB(
                                                255, 49, 43, 230),
                                          ),
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

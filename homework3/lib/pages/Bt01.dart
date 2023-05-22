import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Bt01 extends StatelessWidget {
  const Bt01({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/wall.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: new Container(
                decoration:
                    new BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 20,
                top: 50,
              ),
              child: Text(
                "Qui iste dolor",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 20,
                top: 25,
              ),
              child: const Text(
                "Modi deserunt consequuntur officiis dignissimos culpa. Accusantium quaerat ullam. Odio eos nam est porro officia dolorum porro sint qui. Ratione molestias magnam ipsam culpa ut et qui quo temporibus.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            Expanded(
              child: Container(),
              flex: 4,
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 60,
                        width: 180,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          gradient: LinearGradient(colors: <Color>[
                            Color.fromARGB(255, 229, 82, 178),
                            Color.fromARGB(255, 139, 58, 109)
                          ], begin: Alignment.topLeft, end: Alignment.topRight),
                        ),
                        child: Center(
                          child: Text(
                            "Start",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 25,
                    ),
                    child: const Text(
                      "Modi deserunt consequuntur officiis dignissimos culpa. Accusantium quaerat ullam. Odio eos nam est porro officia dolorum porro sint qui. Ratione molestias magnam ipsam culpa ut et qui quo temporibus.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

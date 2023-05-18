import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BT02 extends StatelessWidget {
  const BT02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Center(
                      child: Text(
                        'Welcome ZendVN',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                        )),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Aperiam itaque tempore quia dolores magnam Hoangdz."),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 22,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Nsi vero ea inventore quaerta venaim odit cornndah excepturi Marvel movie."),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Nsi vero ea inventore quaerta venaim odit cornndah excepturi Marvel movie. Mot doan text rat dai va em dang hoi luoi de go ay",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Aut aut debitis"),
                      Text("Aut aut debitis"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                        color: Colors.amber,
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Bt03 extends StatelessWidget {
  const Bt03({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: GridView.count(
        primary: false,
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        crossAxisCount: 2,
        children: <Widget>[
          Container(
            child: Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {},
                child: Container(
                  height: 50,
                  width: 130,
                  child: Center(
                    child: Text(
                      'Click me',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.yellow),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 255, 208, 54)),
                ),
                onPressed: () {},
                child: Container(
                  height: 50,
                  width: 130,
                  child: Center(
                    child: Text(
                      'Click me',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 223, 40, 40)),
                ),
                child: Container(
                  width: 130,
                  height: 60,
                  child: Center(
                    child: const Text(
                      "Click me",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 38, 215, 100),
                  ),
                ),
                child: Container(
                  width: 130,
                  height: 60,
                  child: Center(
                    child: const Text(
                      "Click me",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Center(
              child: OutlinedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Container(
                  width: 150,
                  height: 50,
                  child: Center(
                    child: const Text("Click me"),
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

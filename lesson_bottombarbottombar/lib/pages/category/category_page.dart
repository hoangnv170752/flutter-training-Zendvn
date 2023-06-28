import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late Timer _timer;
  int _start = 60;

  void startTimer() {
    // ignore: unnecessary_const
    const oneSec = const Duration(seconds: 1);
    // ignore: unnecessary_new
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  late StreamController _streamController;
  @override
  void initState() {
    super.initState();
    _streamController = StreamController<int>();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _streamController.stream.listen((event) {
      print(event);
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: _streamController.stream,
              builder: (context, snapshot) {
                return Text(
                  "$_start",
                  style: TextStyle(
                    fontSize: 100,
                  ),
                );
              },
            ),
            OutlinedButton(
              onPressed: () {
                _streamController.add(1);
              },
              // ignore: prefer_const_constructors
              child: Text("Count down to New Year"),
            ),
          ],
        ),
      ),
    );
  }
}

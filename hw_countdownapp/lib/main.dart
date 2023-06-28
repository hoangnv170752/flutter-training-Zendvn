import 'package:flutter/material.dart';
import 'package:hw_countdownapp/stopwatch.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BTVN Stopwatch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StopWatchTimerButton(),
    );
  }
}

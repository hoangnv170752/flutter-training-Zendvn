import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:homework3/pages/Bt01.dart';
import 'package:homework3/pages/Bt02.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Bt02(),
    );
  }
}

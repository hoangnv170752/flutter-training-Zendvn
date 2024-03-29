import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:homework3/pages/Bt01.dart';
import 'package:homework3/pages/Bt02.dart';
import 'package:homework3/pages/Bt03.dart';
import 'package:homework3/pages/Bt03aTri.dart';
import 'package:homework3/pages/Bt2505.dart';
import 'package:homework3/provider/counter.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => Counter(),
        child: Builder(builder: (BuildContext context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Bt2505(),
          );
        }));
  }
}

import 'package:flutter/material.dart';
import 'package:goodfood/config/const.dart';
import 'package:goodfood/pages/index.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    theme: ThemeData(backgroundColor: dColorMain),
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

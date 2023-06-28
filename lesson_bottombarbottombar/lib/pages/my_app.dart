import 'package:flutter/material.dart';
import 'package:lop/pages/navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationCustom(),
    );
  }
}

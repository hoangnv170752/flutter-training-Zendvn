import 'package:flutter/material.dart';
import 'package:news_app/helper/route.dart';
import 'package:news_app/pages/HomePage.dart';
import 'package:provider/provider.dart';

import 'model/data_class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataClass(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
        routes: AppHelper.router(context),
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:homework3/pages/Bt1.dart';
import 'package:homework3/pages/Bt2-fix.dart';
import 'package:homework3/pages/Bt2.dart';
import 'package:homework3/pages/index.dart';
import 'package:homework3/provider/album_provider.dart';
import 'package:homework3/provider/counter.dart';
import 'package:provider/provider.dart';

import 'components/Category.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AlbumProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(backgroundColor: Color(0xff0EAF89)),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          MyApp.routeName: ((context) => MyApp()),
          // ignore: equal_keys_in_map
          Bt2.routeName: ((context) => Bt2()),
          CategoryPage.routeName: ((context) => CategoryPage()),
          // ignore: equal_keys_in_map
          Bt2fix.routeName: ((context) => Bt2fix()),
        },
      ),
    ),
  );
}

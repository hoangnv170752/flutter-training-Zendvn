import 'package:flutter/material.dart';
import 'package:lesson8/app/theme.dart';
import 'package:lesson8/provider/theme_provider.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeCustom.lightTheme,
            darkTheme: ThemeCustom.dartTheme,
            themeMode: value.themeData,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}

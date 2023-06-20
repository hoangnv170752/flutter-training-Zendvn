import 'package:flutter/material.dart';
import 'package:news_app/app/helper.dart';
import 'package:news_app/app/theme.dart';
import 'package:news_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: AppHelper.providers,
    child: Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.isLight ? ThemeMode.light : ThemeMode.dark,
          initialRoute: AppHelper.initialRoute,
          routes: AppHelper.router(context),
        );
      },
    ),
  ));
}

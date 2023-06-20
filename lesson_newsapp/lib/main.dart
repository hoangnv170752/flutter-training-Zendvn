import 'package:flutter/material.dart';
import 'package:lesson_newsapp/app/helper.dart';
import 'package:lesson_newsapp/app/theme.dart';
import 'package:lesson_newsapp/providers/item_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: AppHelper.providers,
      child: Consumer<CategoryProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.light,
            initialRoute: AppHelper.initialRoute,
            routes: AppHelper.router(context),
          );
        },
      ),
    ),
  );
}

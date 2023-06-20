import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lesson_newsapp/app/color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black),
      centerTitle: true,
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        fontSize: 32,
        color: AppColor.cWhite,
      ),
      titleMedium: GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        fontSize: 28,
        color: AppColor.cWhite,
      ),
      titleSmall: GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        fontSize: 24,
        color: AppColor.cWhite,
      ),
      labelLarge: GoogleFonts.actor(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: AppColor.cTextTitle,
      ),
      labelMedium: GoogleFonts.actor(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: AppColor.cTextDetail,
      ),
      labelSmall: GoogleFonts.actor(
        fontWeight: FontWeight.w400,
        fontSize: 10,
        color: AppColor.cTextSub,
      ),
      displayLarge: GoogleFonts.actor(
        fontWeight: FontWeight.w400,
        fontSize: 30,
        color: AppColor.cTextDetail,
      ),
      displayMedium: GoogleFonts.actor(
        fontWeight: FontWeight.w400,
        fontSize: 15,
        color: AppColor.cTextTitle,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: const TextTheme(
      titleMedium: TextStyle(color: Colors.blue, fontSize: 20),
    ),
  );
}

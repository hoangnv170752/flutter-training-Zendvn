import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.roboto(
        fontWeight: FontWeight.w600,
        fontSize: 36,
        color: Colors.white,
      ),
      titleMedium: GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        fontSize: 32,
        color: Colors.white,
      ),
      titleSmall: GoogleFonts.roboto(
        fontWeight: FontWeight.w200,
        fontSize: 28,
        color: Colors.white,
      ),
      labelLarge: GoogleFonts.roboto(
        fontSize: 36,
        color: Colors.black,
      ),
      labelMedium: GoogleFonts.roboto(
        fontSize: 30,
        color: Colors.black,
      ),
      labelSmall: GoogleFonts.roboto(
        fontSize: 20,
        color: Colors.black,
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

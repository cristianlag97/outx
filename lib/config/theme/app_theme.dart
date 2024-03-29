import 'package:flutter/material.dart' hide Colors;
import 'package:google_fonts/google_fonts.dart';
import 'package:outmap/config/config.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(

      ///* General
      useMaterial3: true,
      colorSchemeSeed: Colors.colorSeed,

      ///* Texts
      textTheme: TextTheme(
        titleLarge: GoogleFonts.raleway()
            .copyWith(fontSize: 36, fontWeight: FontWeight.bold),
        titleMedium: GoogleFonts.raleway()
            .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
        titleSmall: GoogleFonts.raleway().copyWith(fontSize: 20),
        bodyLarge: GoogleFonts.raleway().copyWith(fontSize: 18),
        bodyMedium: GoogleFonts.raleway().copyWith(fontSize: 16),
        bodySmall: GoogleFonts.raleway().copyWith(fontSize: 14),
      ),

      ///* Scaffold Background Color
      scaffoldBackgroundColor: Colors.scaffoldBackgroundColor,

      ///* Buttons
      filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
              textStyle: MaterialStatePropertyAll(GoogleFonts.raleway()
                  .copyWith(fontWeight: FontWeight.w700)))),

      ///* AppBar
      appBarTheme: AppBarTheme(
        color: Colors.scaffoldBackgroundColor,
        titleTextStyle: GoogleFonts.raleway().copyWith(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
      ));
}

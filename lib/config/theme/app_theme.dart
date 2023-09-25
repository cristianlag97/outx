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
          titleLarge: GoogleFonts.montserratAlternates()
              .copyWith(fontSize: 40, fontWeight: FontWeight.bold),
          titleMedium: GoogleFonts.montserratAlternates()
              .copyWith(fontSize: 30, fontWeight: FontWeight.bold),
          titleSmall:
              GoogleFonts.montserratAlternates().copyWith(fontSize: 20)),

      ///* Scaffold Background Color
      scaffoldBackgroundColor: Colors.scaffoldBackgroundColor,

      ///* Buttons
      filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
              textStyle: MaterialStatePropertyAll(
                  GoogleFonts.montserratAlternates()
                      .copyWith(fontWeight: FontWeight.w700)))),

      ///* AppBar
      appBarTheme: AppBarTheme(
        color: Colors.scaffoldBackgroundColor,
        titleTextStyle: GoogleFonts.montserratAlternates().copyWith(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
      ));
}

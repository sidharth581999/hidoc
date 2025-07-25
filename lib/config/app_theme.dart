
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/config/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    // brightness: Brightness.light,
    // primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      
      backgroundColor: AppConfig.black,
      elevation: 0,
      // iconTheme: IconThemeData(color: Colors.white),
      // titleTextStyle: TextStyle(
      //   color: Colors.white,
      //   fontSize: 20,
      //   fontWeight: FontWeight.bold,
      // ),
    ),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w400),
      bodyMedium: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w600),
      bodyLarge: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400),
      labelSmall: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500),
      labelMedium: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400),
      labelLarge: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
      titleSmall: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w700),
      titleMedium: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400),
      titleLarge: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
      headlineSmall: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w400),
      headlineMedium: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w400),
      headlineLarge: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w700),
      displaySmall: GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.w300),
      displayMedium: GoogleFonts.inter(fontSize: 40, fontWeight: FontWeight.w400),
      displayLarge: GoogleFonts.inter(fontSize: 100, fontWeight: FontWeight.w400),
    ),
    // buttonTheme: const ButtonThemeData(buttonColor: Colors.blue),
  );
}

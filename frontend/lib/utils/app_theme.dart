import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFF5E2A6F),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: const Color(0xFF5E2A6F),
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFF5E2A6F)),
      titleTextStyle: GoogleFonts.poppins(
        color: Color(0xFF5E2A6F),
        fontSize: 24,
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xFF5E2A6F),
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 16,
        color: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF5E2A6F),
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 18,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}
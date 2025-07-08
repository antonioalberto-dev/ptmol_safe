import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ptmol/theme/colors/default_colors.dart';

class DefaultTheme {
  static TextStyle titleLarge = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static TextStyle subtitleMedium = GoogleFonts.poppins(
    fontSize: 16,
    color: DefaultColors.primary[500],
    fontWeight: FontWeight.w500,
    height: 1.0,
  );

  static TextStyle subtitle2Medium = GoogleFonts.poppins(
    fontSize: 16,
    color: DefaultColors.primary[500],
    fontWeight: FontWeight.bold,
    height: 1.0,
  );

  static TextStyle headerInput = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    height: 1.0,
  );

  static TextStyle hintStyle = GoogleFonts.poppins(
    fontSize: 14,
    color: DefaultColors.dark[200],
  );

  static TextStyle text = GoogleFonts.poppins(
    fontSize: 14,
    color: Colors.black,
  );

  static TextStyle textOnboarding = GoogleFonts.poppins(
    fontSize: 15,
    color: Colors.black,
  );

  static TextStyle button = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.0,
  );
}

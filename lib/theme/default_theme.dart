import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ptmol/theme/colors/default_colors.dart';

class DefaultTheme {
  static TextStyle titleLarge = GoogleFonts.montserrat(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static TextStyle subtitleMedium = GoogleFonts.montserrat(
    fontSize: 16,
    color: DefaultColors.primary[500],
    fontWeight: FontWeight.w500,
    height: 1.0,
  );

  static TextStyle subtitle2Medium = GoogleFonts.montserrat(
    fontSize: 16,
    color: DefaultColors.primary[500],
    fontWeight: FontWeight.bold,
    height: 1.0,
  );

  static TextStyle headerInput = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    height: 1.0,
  );

  static TextStyle hintStyle = GoogleFonts.montserrat(
    fontSize: 14,
    color: DefaultColors.dark[200],
  );

  static TextStyle text = GoogleFonts.montserrat(
    fontSize: 14,
    color: Colors.black,
  );

  static TextStyle textOnboarding = GoogleFonts.montserrat(
    fontSize: 15,
    color: Colors.black,
  );

  static TextStyle button = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.0,
  );
}

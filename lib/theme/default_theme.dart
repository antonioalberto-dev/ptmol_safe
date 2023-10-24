import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ptmol/theme/colors/default_colors.dart';

class DefaultTheme {
  ThemeData theme = ThemeData(

  );

  static TextStyle titleLarge = GoogleFonts.montserrat(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static TextStyle subtitleMedium = GoogleFonts.montserrat(
    fontSize: 14,
    color: DefaultColors.primary[500],
  );
}
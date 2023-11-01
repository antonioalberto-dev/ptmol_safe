import 'package:flutter/material.dart';

class DefaultColors{
  static ColorSwatch primary = const ColorSwatch<int>(50, {
    50: Color(0xFFf2e6fc),
    100: Color(0xFFd6b0f5),
    200: Color(0xFFc38af0),
    300: Color(0xFFa754e9),
    400: Color(0xFF9633e5),
    500: Color(0xFF7c00de),
  });

  static ColorSwatch dark = const ColorSwatch<int>(50, {
    50: Color(0xFFeaebec),
    100: Color(0xFFbdbfc4),
    200: Color(0xFF9da1a8),
    300: Color(0xFF707680),
    400: Color(0xFF545b67),
    500: Color(0xFF293241),
  });

  static ColorSwatch bg = const ColorSwatch<int>(50, {
    50: Color(0xFFfdfdfd),
    100: Color(0xFFf9f9f9),
    400: Color(0xFFefefef),
    500: Color(0xFFebebeb),
    600: Color(0xFFd6d6d6),
  });

  static Color success = const Color(0xFF39b690);

  static Color danger = const Color(0xFFee6c4d);

  static Color annotation = const Color(0xFFF6BE2C);
}
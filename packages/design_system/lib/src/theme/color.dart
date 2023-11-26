import 'package:flutter/material.dart';

class SurfaceColor {
  SurfaceColor._();
  static const Color primary = Color(_primaryPrimaryValue);
  static const Color secondary = Color.fromARGB(255, 95, 86, 52);
  static const Color backgroundColor = Color.fromARGB(255, 249, 249, 249);
  static const Color deeperBackgroundColor = Color.fromARGB(255, 233, 233, 233);
  static const Color foregroundColor = Color.fromARGB(255, 255, 255, 255);
  static const Color disabled = Color.fromARGB(255, 234, 234, 234);
  static const Color error = Color.fromARGB(255, 229, 8, 8);
  static const Color success = Color.fromARGB(255, 13, 230, 13);
  static const Color deactivated = Color.fromARGB(255, 240, 216, 182);
  static const MaterialColor primaryPallete =
      MaterialColor(_primaryPrimaryValue, <int, Color>{
    50: Color(0xFFFFF9EB),
    100: Color(0xFFFFF1CE),
    200: Color(0xFFFFE8AD),
    300: Color(0xFFFFDE8C),
    400: Color(0xFFFFD774),
    500: Color(_primaryPrimaryValue),
    600: Color(0xFFFFCB53),
    700: Color(0xFFFFC449),
    800: Color(0xFFFFBE40),
    900: Color(0xFFFFB32F),
  });
  static const int _primaryPrimaryValue = 0xFFFFD05B;
}

class TextColor {
  TextColor._();

  static const Color primary = Color(0xFF000000);

  static const Color secondary = Color.fromARGB(255, 189, 189, 188);

  static const Color tertiary = Colors.white;

  static const Color special = Color.fromARGB(255, 180, 105, 0);

  static const Color unspecial = Color.fromARGB(255, 130, 130, 130);

  static const Color deactivated = Color.fromARGB(255, 185, 176, 153);
}

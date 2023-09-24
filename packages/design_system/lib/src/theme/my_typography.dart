import 'package:design_system/src/theme/color.dart';
import 'package:flutter/material.dart';

class MyTypography {
  const MyTypography._();
  static TextStyle get h1 => const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        fontFamily: 'Helvetica',
        color: TextColor.primary,
      );
  static TextStyle get h2 => const TextStyle(
        fontSize: 28,
        fontFamily: 'Helvetica',
        color: TextColor.primary,
      );
  static TextStyle get h3 => const TextStyle(
        fontSize: 21,
        fontFamily: 'Helvetica',
        color: TextColor.primary,
      );

  static TextStyle get p => const TextStyle(
        fontSize: 16,
        fontFamily: 'Helvetica',
        color: TextColor.primary,
      );
  static TextStyle get small => const TextStyle(
        fontSize: 12,
        fontFamily: 'Helvetica',
        color: TextColor.primary,
      );
}

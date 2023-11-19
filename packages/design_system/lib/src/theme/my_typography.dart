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
        fontSize: 24,
        fontFamily: 'Helvetica',
        color: TextColor.primary,
        fontWeight: FontWeight.bold,
      );
  static TextStyle get h3 => const TextStyle(
        fontSize: 20,
        fontFamily: 'Helvetica',
        color: TextColor.primary,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get h4Regular => const TextStyle(
        fontSize: 18,
        fontFamily: 'Helvetica',
        color: TextColor.primary,
      );

  static TextStyle get h4Strong => const TextStyle(
        fontSize: 18,
        fontFamily: 'Helvetica',
        color: TextColor.primary,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get h5Regular => const TextStyle(
        fontSize: 16,
        fontFamily: 'Helvetica',
        color: TextColor.primary,
      );

  static TextStyle get h5Strong => const TextStyle(
        fontSize: 16,
        fontFamily: 'Helvetica',
        fontWeight: FontWeight.bold,
        color: TextColor.primary,
      );

  static TextStyle get bodyRegular => const TextStyle(
        fontSize: 14,
        fontFamily: 'Helvetica',
        color: TextColor.primary,
      );

  static TextStyle get bodyStrong => const TextStyle(
        fontSize: 14,
        fontFamily: 'Helvetica',
        fontWeight: FontWeight.bold,
        color: TextColor.primary,
      );

  static TextStyle get captionStrong => const TextStyle(
        fontSize: 12,
        fontFamily: 'Helvetica',
        fontWeight: FontWeight.bold,
        color: TextColor.primary,
      );

  static TextStyle get captionRegular => const TextStyle(
        fontSize: 12,
        fontFamily: 'Helvetica',
        color: TextColor.primary,
      );
}

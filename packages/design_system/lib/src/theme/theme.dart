import 'package:design_system/src/theme/color.dart';
import 'package:flutter/material.dart';

export 'my_typography.dart';
export 'spacing.dart';
export 'color.dart';

class MyTheme {
  MyTheme._();

  static ThemeData get themeData => ThemeData(
        primarySwatch: SurfaceColor.primaryPallete,
        scaffoldBackgroundColor: SurfaceColor.backgroundColor,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: SurfaceColor.foregroundColor,
          selectedItemColor: TextColor.primary,
          unselectedItemColor: TextColor.secondary,
          type: BottomNavigationBarType.fixed,
        ),
      );
}

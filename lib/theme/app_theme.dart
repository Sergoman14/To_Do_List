import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

abstract class TodoTheme {
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      colorSchemeSeed: LightThemeColors.backPrimary,
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor: LightThemeColors.backPrimary,
        foregroundColor: LightThemeColors.labelPrimary,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: LightThemeColors.colorWhite,
        backgroundColor: LightThemeColors.colorBlue,
        shape: CircleBorder(),
      ),
      scaffoldBackgroundColor: LightThemeColors.backPrimary,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      colorSchemeSeed: DarkThemeColors.backSecondary,
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor: DarkThemeColors.backPrimary,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        shape: CircleBorder(),
        foregroundColor: DarkThemeColors.colorWhite,
        backgroundColor: DarkThemeColors.colorBlue,
      ),
      scaffoldBackgroundColor: DarkThemeColors.backPrimary,
    );
  }
}

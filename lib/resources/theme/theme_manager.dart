import 'package:flutter/material.dart';

import '../fonts_manager.dart';
import 'colors_manager.dart';
import 'custom_theme_data.dart';

class ThemeManager {
  static ThemeData getLightTheme() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: FontsManager.fontFamily,
      fontFamilyFallback: FontsManager.fontFamilyFallback,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: ColorsManager.primary,
        brightness: Brightness.light,
        background: ColorsManager.background,
      ),
      scaffoldBackgroundColor: ColorsManager.background,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorsManager.background,
        centerTitle: true,
        elevation: 0.0,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0.0,
        titleTextStyle: TextStyle(
          fontSize: 16.0,
          color: ColorsManager.primary,
        ),
        iconTheme: IconThemeData(
          color: ColorsManager.primary,
        ),
      ),
    ).copyWith(
      extensions: <ThemeExtension<CustomThemeData>>[
        CustomThemeData(
          white: ColorsManager.white,
          black: ColorsManager.black,
          success: ColorsManager.success,
          error: ColorsManager.error,
          warning: ColorsManager.warning,
          snackBarBackground: ColorsManager.snackBarBackground,
          grey: ColorsManager.grey,
        )
      ],
    );
  }

  static ThemeData getDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: FontsManager.fontFamily,
      fontFamilyFallback: FontsManager.fontFamilyFallback,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: ColorsManager.darkPrimary,
        brightness: Brightness.dark,
        background: ColorsManager.darkBackground,
      ),
      scaffoldBackgroundColor: ColorsManager.darkBackground,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorsManager.darkBackground,
        centerTitle: true,
        elevation: 0.0,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0.0,
        titleTextStyle: TextStyle(
          fontSize: 16.0,
          color: ColorsManager.darkPrimary,
        ),
        iconTheme: IconThemeData(
          color: ColorsManager.darkPrimary,
        ),
      ),
    ).copyWith(
      extensions: <ThemeExtension<CustomThemeData>>[
        CustomThemeData(
          white: ColorsManager.darkWhite,
          black: ColorsManager.darkBlack,
          success: ColorsManager.success,
          error: ColorsManager.error,
          warning: ColorsManager.warning,
          snackBarBackground: ColorsManager.snackBarBackground,
          grey: ColorsManager.darkGrey,
        )
      ],
    );
  }
}

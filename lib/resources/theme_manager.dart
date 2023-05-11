import 'package:flutter/material.dart';

import 'color_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: true,

    /// main colors
    // primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: ColorManager.primary,
      secondary: ColorManager.secondary,
      background: ColorManager.white,
    ),

    /// card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: 4.0,
    ),

    /// app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: 4.0,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle: TextStyle(
        fontSize: 16.0,
        color: ColorManager.white,
      ),
    ),

    /// button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.lightPrimary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(
          color: ColorManager.white,
          fontSize: 17.0,
        ),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    ),

    /// text theme
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: ColorManager.darkGrey,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
      // used in auth screen
      displayMedium: TextStyle(
        color: ColorManager.white,
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
      ),
      // used in auth screen
      displaySmall: TextStyle(
        color: ColorManager.white,
        fontSize: 18.0,
      ),
      headlineLarge: TextStyle(
        color: ColorManager.darkGrey,
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: TextStyle(
        color: ColorManager.darkGrey,
        fontSize: 14.0,
      ),
      titleMedium: TextStyle(
        color: ColorManager.primary,
        fontSize: 16.0,
      ),
      bodyLarge: TextStyle(
        color: ColorManager.grey1,
      ),
      bodySmall: TextStyle(
        color: ColorManager.white,
        fontSize: 16.0,
      ),
    ),

    /// input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(8.0),
      hintStyle: TextStyle(
        color: ColorManager.grey,
        fontSize: 14.0,
      ),
      labelStyle: TextStyle(
        color: ColorManager.grey,
        fontSize: 14.0,
      ),
      errorStyle: TextStyle(
        color: ColorManager.error,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.grey,
          width: 1.5,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: 1.5,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.error,
          width: 1.5,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: 1.5,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
      ),
    ),
  );
}

ThemeData getApplicationDarkTheme() {
  return ThemeData(
    /// main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,

    /// card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: 4.0,
    ),

    /// app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: 4.0,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle: TextStyle(
        fontSize: 16.0,
        color: ColorManager.white,
      ),
    ),

    /// button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.lightPrimary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(
          color: ColorManager.white,
          fontSize: 17.0,
        ),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    ),

    /// text theme
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: ColorManager.darkGrey,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: TextStyle(
        color: ColorManager.darkGrey,
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: TextStyle(
        color: ColorManager.darkGrey,
        fontSize: 14.0,
      ),
      titleMedium: TextStyle(
        color: ColorManager.primary,
        fontSize: 16.0,
      ),
      bodyLarge: TextStyle(
        color: ColorManager.grey1,
      ),
      bodySmall: TextStyle(
        color: ColorManager.grey,
      ),
    ),

    /// input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(8.0),
      hintStyle: TextStyle(
        color: ColorManager.grey,
        fontSize: 14.0,
      ),
      labelStyle: TextStyle(
        color: ColorManager.grey,
        fontSize: 14.0,
      ),
      errorStyle: TextStyle(
        color: ColorManager.error,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.grey,
          width: 1.5,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: 1.5,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.error,
          width: 1.5,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: 1.5,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
      ),
    ),
  );
}

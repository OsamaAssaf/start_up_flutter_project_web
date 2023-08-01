import 'package:flutter/material.dart';

import 'colors_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      useMaterial3: true,

      /// main colors
      // primaryColor: ColorManager.primary,
      primaryColorLight: ColorsManager.lightPrimary,
      primaryColorDark: ColorsManager.darkPrimary,
      disabledColor: ColorsManager.grey1,
      splashColor: ColorsManager.lightPrimary,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: ColorsManager.primary,
        secondary: ColorsManager.secondary,
        background: ColorsManager.white,
      ),

      /// card view theme
      cardTheme: CardTheme(
        color: ColorsManager.white,
        shadowColor: ColorsManager.grey,
        elevation: 4.0,
      ),

      /// app bar theme
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorsManager.primary,
        elevation: 4.0,
        shadowColor: ColorsManager.lightPrimary,
        titleTextStyle: TextStyle(
          fontSize: 16.0,
          color: ColorsManager.white,
        ),
      ),

      /// button theme
      buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorsManager.grey1,
        buttonColor: ColorsManager.primary,
        splashColor: ColorsManager.lightPrimary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(
            color: ColorsManager.white,
            fontSize: 17.0,
          ),
          backgroundColor: ColorsManager.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),

      /// text theme
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: ColorsManager.darkGrey,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
        // used in auth screen
        displayMedium: TextStyle(
          color: ColorsManager.white,
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        // used in auth screen
        displaySmall: TextStyle(
          color: ColorsManager.white,
          fontSize: 18.0,
        ),
        headlineLarge: TextStyle(
          color: ColorsManager.darkGrey,
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: TextStyle(
          color: ColorsManager.darkGrey,
          fontSize: 14.0,
        ),
        titleMedium: TextStyle(
          color: ColorsManager.primary,
          fontSize: 16.0,
        ),
        bodyLarge: TextStyle(
          color: ColorsManager.grey1,
        ),
        bodySmall: TextStyle(
          color: ColorsManager.white,
          fontSize: 16.0,
        ),
      ),

      /// input decoration theme (text form field)
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(8.0),
        hintStyle: TextStyle(
          color: ColorsManager.grey,
          fontSize: 14.0,
        ),
        labelStyle: TextStyle(
          color: ColorsManager.grey,
          fontSize: 14.0,
        ),
        errorStyle: TextStyle(
          color: ColorsManager.error,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsManager.grey,
            width: 1.5,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              8.0,
            ),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsManager.primary,
            width: 1.5,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              8.0,
            ),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsManager.error,
            width: 1.5,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              8.0,
            ),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsManager.primary,
            width: 1.5,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              8.0,
            ),
          ),
        ),
      ),
      drawerTheme: const DrawerThemeData(
        elevation: 2,
        width: 100,
      ));
}

ThemeData getApplicationDarkTheme() {
  return ThemeData(
    /// main colors
    primaryColor: ColorsManager.primary,
    primaryColorLight: ColorsManager.lightPrimary,
    primaryColorDark: ColorsManager.darkPrimary,
    disabledColor: ColorsManager.grey1,
    splashColor: ColorsManager.lightPrimary,

    /// card view theme
    cardTheme: CardTheme(
      color: ColorsManager.white,
      shadowColor: ColorsManager.grey,
      elevation: 4.0,
    ),

    /// app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorsManager.primary,
      elevation: 4.0,
      shadowColor: ColorsManager.lightPrimary,
      titleTextStyle: TextStyle(
        fontSize: 16.0,
        color: ColorsManager.white,
      ),
    ),

    /// button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorsManager.grey1,
      buttonColor: ColorsManager.primary,
      splashColor: ColorsManager.lightPrimary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(
          color: ColorsManager.white,
          fontSize: 17.0,
        ),
        backgroundColor: ColorsManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    ),

    /// text theme
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: ColorsManager.darkGrey,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: TextStyle(
        color: ColorsManager.darkGrey,
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: TextStyle(
        color: ColorsManager.darkGrey,
        fontSize: 14.0,
      ),
      titleMedium: TextStyle(
        color: ColorsManager.primary,
        fontSize: 16.0,
      ),
      bodyLarge: TextStyle(
        color: ColorsManager.grey1,
      ),
      bodySmall: TextStyle(
        color: ColorsManager.grey,
      ),
    ),

    /// input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(8.0),
      hintStyle: TextStyle(
        color: ColorsManager.grey,
        fontSize: 14.0,
      ),
      labelStyle: TextStyle(
        color: ColorsManager.grey,
        fontSize: 14.0,
      ),
      errorStyle: TextStyle(
        color: ColorsManager.error,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManager.grey,
          width: 1.5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManager.primary,
          width: 1.5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManager.error,
          width: 1.5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManager.primary,
          width: 1.5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
      ),
    ),
  );
}

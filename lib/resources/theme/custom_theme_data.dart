import 'package:flutter/material.dart';

class CustomThemeData extends ThemeExtension<CustomThemeData> {
  CustomThemeData({
    required this.white,
    required this.black,
    required this.success,
    required this.error,
    required this.warning,
    required this.snackBarBackground,
    required this.grey,
    required this.textField,
    required this.pink,
    required this.blue,
  });
  final Color white;
  final Color black;
  final Color success;
  final Color error;
  final Color warning;
  final Color snackBarBackground;
  final Color grey;
  final Color textField;
  final Color pink;
  final Color blue;

  @override
  ThemeExtension<CustomThemeData> copyWith() {
    return CustomThemeData(
      white: white,
      black: black,
      success: success,
      error: error,
      warning: warning,
      snackBarBackground: snackBarBackground,
      grey: grey,
      textField: textField,
      pink: pink,
      blue: blue,
    );
  }

  @override
  ThemeExtension<CustomThemeData> lerp(
      covariant ThemeExtension<CustomThemeData>? other, double t) {
    if (other is! CustomThemeData) {
      return this;
    }
    return CustomThemeData(
      white: white,
      black: black,
      success: success,
      error: error,
      warning: warning,
      snackBarBackground: snackBarBackground,
      grey: grey,
      textField: textField,
      pink: pink,
      blue: blue,
    );
  }
}

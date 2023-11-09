import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:start_up_workspace/resources/constants_manager.dart';

class SharedPrefs {
  SharedPrefs._();

  static SharedPrefs instance = SharedPrefs._();

  late SharedPreferences sharedPreferences;

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // Future<void> setUserModel(UserModel userModel) async {
  //   await sharedPreferences.setString(DotenvManager.userModelPrefsKey,
  //       jsonEncode(userModel.toJson(isLogin: false)));
  // }

  // UserModel? getUserModel() {
  //   final String? data =
  //       sharedPreferences.getString(DotenvManager.userModelPrefsKey);
  //   if (data == null) {
  //     return null;
  //   }
  //   return UserModel.fromJson(jsonDecode(data)['PersonalInformation'],
  //       isFullPhotoUrl: true);
  // }

  // Future<void> clearUserData() async {
  //   await sharedPreferences.remove(DotenvManager.userModelPrefsKey);
  // }

  // Future<void> setThemeMode(ThemeMode themeMode) async {
  //   if (themeMode == ThemeMode.system) {
  //     await sharedPreferences.remove(DotenvManager.isDarkThemePrefsKey);
  //     return;
  //   }
  //   await sharedPreferences.setBool(DotenvManager.isDarkThemePrefsKey,
  //       themeMode == ThemeMode.light ? false : true);
  // }

  ThemeMode getThemeMode() {
    final bool? isDark = false;
    // sharedPreferences.getBool(DotenvManager.isDarkThemePrefsKey);
    return isDark == true
        ? ThemeMode.dark
        : isDark == false
            ? ThemeMode.light
            : ThemeMode.system;
  }

  // Future<void> setIsFirstOpen(bool value) async {
  //   await sharedPreferences.setBool(DotenvManager.isFirstOpenPrefsKey, value);
  // }

  // bool getIsFirstOpen() {
  //   // return true;
  //   return sharedPreferences.getBool(DotenvManager.isFirstOpenPrefsKey) ?? true;
  // }

  Future<void> setLanguage(String value) async {
    await sharedPreferences.setString(DotenvManager.languagePrefsKey, value);
  }

  String getLanguage() {
    return sharedPreferences.getString(DotenvManager.languagePrefsKey) ??
        ConstantsManager.arabicLangValue;
  }

  // static Future saveLocale(String locale) async {
  //   await sharedPreferences.setString(DotenvManager.languagePrefsKey, locale);
  // }
}

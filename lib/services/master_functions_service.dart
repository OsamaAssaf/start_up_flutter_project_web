import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import 'package:package_info_plus/package_info_plus.dart';

import '../main.dart';
import '../resources/theme/colors_manager.dart';
import 'shared_prefs_service.dart';

class MasterFunctionsService {
  MasterFunctionsService._();
  static final MasterFunctionsService instance = MasterFunctionsService._();
  Future<void> initPackageInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  Future<void> initPreferredOrientations() async {
    await SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
  }

  void initSystemUiStyle() {
    final ThemeMode themeMode = SharedPrefsService.instance.getThemeMode();
    if (themeMode == ThemeMode.light) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: ColorsManager.background,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      );
    } else if (themeMode == ThemeMode.dark) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: ColorsManager.darkBackground,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
      );
    } else {
      final Brightness brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
      final bool isDarkMode = brightness == Brightness.dark;
      if (isDarkMode) {
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: ColorsManager.darkBackground,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
          ),
        );
      } else {
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: ColorsManager.background,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
        );
      }
    }
  }
}

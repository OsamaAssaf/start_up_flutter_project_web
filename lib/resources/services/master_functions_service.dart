import '../helpers/all_imports.dart';

class MasterFunctionsService {
  MasterFunctionsService._();

  static final MasterFunctionsService _instance = MasterFunctionsService._();
  factory MasterFunctionsService() => _instance;
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
    final ThemeMode themeMode = SharedPrefsService().getThemeMode();
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

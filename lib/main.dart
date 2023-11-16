import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:loading_plus/loading_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'resources/routes_manager.dart';
import 'resources/theme/custom_theme_data.dart';
import 'resources/theme/theme_manager.dart';
import 'services/master_functions_service.dart';
import 'services/notification_service.dart';
import 'services/shared_prefs_service.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

late AppLocalizations localizations;
late ThemeData theme;
late CustomThemeData customTheme;
late SharedPreferences sharedPreferences;
late PackageInfo packageInfo;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait(
    [
      dotenv.load(),
      SharedPrefsService.instance.init(),
      MasterFunctionsService.instance.initPackageInfo(),
      MasterFunctionsService.instance.initPreferredOrientations(),
      NotificationService.initNotifications(),
    ],
  );
  LoadingPlus.instance.init(navigatorKey);
  MasterFunctionsService.instance.initSystemUiStyle();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      NotificationService.initListenersAndPermission();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) {
        localizations = AppLocalizations.of(context)!;
        return localizations.appName;
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(SharedPrefsService.instance.getLanguage()),
      theme: ThemeManager.getLightTheme(),
      darkTheme: ThemeManager.getDarkTheme(),
      themeMode: SharedPrefsService.instance.getThemeMode(),
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      initialRoute: Routes.splashRoute,
      getPages: RouteGenerator.getPages(),
      unknownRoute: GetPage(
        name: Routes.unDefinedRoute,
        page: () => RouteGenerator.unDefinedRoute(),
      ),
    );
  }
}

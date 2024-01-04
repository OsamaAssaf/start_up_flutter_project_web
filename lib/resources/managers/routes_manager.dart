import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../main.dart';
import '../../modules/auth/binding/auth_binding.dart';
import '../../modules/auth/view/auth_view.dart';
import '../../modules/connection_error/binding/connection_error_binding.dart';
import '../../modules/connection_error/view/connection_error_view.dart';
import '../../modules/home/binding/home_binding.dart';
import '../../modules/home/view/home_view.dart';
import '../../modules/settings/binding/settings_binding.dart';
import '../../modules/settings/view/settings_view.dart';
import '../../modules/splash/binding/splash_binding.dart';
import '../../modules/splash/view/splash_view.dart';

class Routes {
  static const String unDefinedRoute = '/NotFoundView';
  static const String splashRoute = '/SplashView';
  static const String authRoute = '/AuthView';
  static const String homeRoute = '/HomeView';
  static const String connectionErrorRoute = '/ConnectionErrorView';
  static const String settingsRoute = '/SettingsView';

  static Map<String, bool> shouldAuthenticatedRoutes = {
    unDefinedRoute: false,
    splashRoute: false,
    authRoute: false,
    homeRoute: false,
    connectionErrorRoute: false,
    settingsRoute: false,
  };
}

class RouteGenerator {
  static List<GetPage> getPages() {
    return <GetPage>[
      GetPage(
        name: Routes.splashRoute,
        page: () => SplashView(),
        binding: SplashBinding(),
      ),
      GetPage(
        name: Routes.authRoute,
        page: () => AuthView(),
        binding: AuthBinding(),
      ),
      GetPage(
        name: Routes.homeRoute,
        page: () => HomeView(),
        binding: HomeBinding(),
      ),
      GetPage(
        name: Routes.connectionErrorRoute,
        page: () => ConnectionErrorView(),
        binding: ConnectionErrorBinding(),
      ),
      GetPage(
        name: Routes.settingsRoute,
        page: () => SettingsView(),
        binding: SettingsBinding(),
      ),
    ];
  }

  static Scaffold unDefinedRoute() {
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.noRouteFound),
      ),
      body: Center(
        child: Text(localizations.noRouteFound),
      ),
    );
  }
}

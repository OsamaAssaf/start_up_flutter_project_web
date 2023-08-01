import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:start_up_workspace/modules/auth/binding/auth_binding.dart';
import 'package:start_up_workspace/modules/splash/binding/splash_binding.dart';
import '../main.dart';
import '../modules/auth/view/auth_view.dart';
import '../modules/home/view/home_view.dart';

import '../modules/splash/view/splash_view.dart';

class Routes {
  static const String splashRoute = '/splashView';
  static const String authRoute = '/authView';
  static const String homeRoute = '/homeView';
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
        page: () => const HomeView(),
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

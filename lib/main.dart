import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import 'resources/routes_manager.dart';
import 'resources/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: getApplicationTheme(),
      darkTheme: getApplicationDarkTheme(),
      initialRoute: Routes.splashRoute,
      getPages: RouteGenerator.getPages(),
      unknownRoute: GetPage(
        name: '/notfound',
        page: () => RouteGenerator.unDefinedRoute(context),
      ),
    );
  }
}

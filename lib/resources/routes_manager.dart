import 'package:flutter/material.dart';
import '../modules/home/view/home_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Routes {
  static const String homeRoute = '/homeView';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) {
        final AppLocalizations localizations = AppLocalizations.of(context)!;
        return Scaffold(
          appBar: AppBar(
            title: Text(localizations.noRouteFound),
          ),
          body:  Center(
            child: Text(localizations.noRouteFound),
          ),
        );
      },
    );
  }
}

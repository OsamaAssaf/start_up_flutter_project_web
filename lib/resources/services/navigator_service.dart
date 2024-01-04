import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:start_up_workspace_web/models/user_model.dart';

import '../globals.dart';
import '../managers/routes_manager.dart';

class NavigatorService extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final bool? shouldAuthenticated = Routes.shouldAuthenticatedRoutes[route.settings.name];
    if (shouldAuthenticated != true) return;
    final UserModel? userModel = Globals.instance.userModel;
    if (userModel != null) return;
    Get.offAllNamed(Routes.authRoute);
  }
}

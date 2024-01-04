import '../helpers/all_imports.dart';

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

import 'package:get/get.dart';

import '../../../resources/enums.dart';
import '../../../resources/managers/routes_manager.dart';

class AuthController extends GetxController {
  AuthType authType = AuthType.login;
  void changeAuthType() {
    authType = authType == AuthType.login ? AuthType.signUp : AuthType.login;
    update();
  }

  Future<void> submit() async {
    Get.offAllNamed(Routes.homeRoute);
  }
}

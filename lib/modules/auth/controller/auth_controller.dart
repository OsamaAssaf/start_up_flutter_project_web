import 'package:get/get.dart';

class AuthController extends GetxController {
  AuthType authType = AuthType.login;
  void changeAuthType() {
    authType = authType == AuthType.login ? AuthType.signUp : AuthType.login;
    update();
  }

  Future<void> submit() async {}
}

enum AuthType {
  login,
  signUp,
}

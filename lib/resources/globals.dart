import '../models/auth_model.dart';

class Globals {
  Globals._();
  static final Globals instance = Globals._();

  AuthModel? authModel;

  void changeAuthModel(AuthModel value) {
    authModel = value;
  }
}

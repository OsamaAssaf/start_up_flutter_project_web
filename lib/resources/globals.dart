 import 'package:start_up_workspace/models/auth_model.dart';

class Global{

  Global._();
  static final Global instance = Global._();

  AuthModel? authModel;

  void chageOuthModel(AuthModel value) {
    authModel = value;
  }
}

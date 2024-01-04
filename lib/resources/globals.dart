import 'package:start_up_workspace_web/models/user_model.dart';

class Globals {
  Globals._();

  static final Globals instance = Globals._();

  UserModel? userModel;
  void changeUserModel(UserModel? value) {
    userModel = value;
  }
}

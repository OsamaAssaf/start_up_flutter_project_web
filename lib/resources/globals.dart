import 'helpers/all_imports.dart';

class Globals {
  Globals._();

  static final Globals instance = Globals._();

  UserModel? userModel;

  void changeUserModel(UserModel? value) {
    userModel = value;
  }
}

import '../helpers/all_imports.dart';

class SharedPrefsService {
  SharedPrefsService._();

  static final SharedPrefsService _instance = SharedPrefsService._();
  factory SharedPrefsService() => _instance;
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveUserModel(UserModel value) async {
    final String userData = jsonEncode(value.toJson());
    final String encryptedUserData = await EncryptionService().encrypt(userData);
    await sharedPreferences.setString(
      DotenvManager.userModelPrefsKey,
      encryptedUserData,
    );
  }

  Future<UserModel?> getUserModel() async {
    final String? encryptedUserData = sharedPreferences.getString(DotenvManager.userModelPrefsKey);
    if (encryptedUserData == null) return null;
    final String userData = await EncryptionService().decrypt(encryptedUserData);
    return UserModel.fromJson(
      jsonDecode(userData),
    );
  }

  Future<void> setLanguage(String value) async {
    await sharedPreferences.setString(DotenvManager.languagePrefsKey, value);
  }

  String getLanguage() {
    return sharedPreferences.getString(DotenvManager.languagePrefsKey) ??
        ConstantsManager.arabicLangValue;
  }

  Future<void> saveThemeMode(ThemeMode themeMode) async {
    await sharedPreferences.setString(
      DotenvManager.themeModePrefsKey,
      themeMode == ThemeMode.dark
          ? ThemeMode.dark.toString()
          : themeMode == ThemeMode.light
              ? ThemeMode.light.toString()
              : ThemeMode.system.toString(),
    );
  }

  ThemeMode getThemeMode() {
    final String? mode = sharedPreferences.getString(DotenvManager.themeModePrefsKey);
    return mode == ThemeMode.dark.toString()
        ? ThemeMode.dark
        : mode == ThemeMode.light.toString()
            ? ThemeMode.light
            : ThemeMode.system;
  }

  Future<void> saveIsFirstTime(bool value) async {
    await sharedPreferences.setBool(DotenvManager.isFirstTimePrefsKey, value);
  }

  bool getIsFirstTime() {
    return sharedPreferences.getBool(DotenvManager.isFirstTimePrefsKey) ?? true;
  }
}

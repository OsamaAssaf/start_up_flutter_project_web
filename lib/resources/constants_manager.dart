import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConstantsManager {
  static const String arabicLangValue = 'ar';
  static const String englishLangValue = 'en';
  static const int genderMaleValue = 1;
  static const int genderFemaleValue = 2;
  static const double appbarHeight = 50.0;
  static const Duration timedOutDuration = Duration(seconds: 15);
  static const String timedOutErrorException = 'timedOutError';
}

class DotenvManager {
  static final String appStoreId = dotenv.env['APP_STORE_ID']!;
  static final String languagePrefsKey = dotenv.env['LANGUAGE_PREFS_KEY']!;
  static final String themeModePrefsKey = dotenv.env['THEME_MODE_PREFS_KEY']!;

  static final String _domain = dotenv.env['DOMAIN']!;
  static final String _mainApiPath = dotenv.env['API_PATH']!;
  static final String apiPath = '$_domain/$_mainApiPath';
}

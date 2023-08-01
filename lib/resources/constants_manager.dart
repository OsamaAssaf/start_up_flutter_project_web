import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConstantsManager {}

class DotenvManager {
  static final String languagePrefsKey = dotenv.env['LANGUAGE_PREFS_KEY']!;
}

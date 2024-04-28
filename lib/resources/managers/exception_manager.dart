import '../helpers/all_imports.dart';

class ExceptionManager {
  ExceptionManager._();

  static final ExceptionManager _instance = ExceptionManager._();
  factory ExceptionManager() => _instance;
  static const Duration timedOutDuration = Duration(seconds: 15);
  static const String timedOutException = 'timedOut';

  final Map<String, dynamic> exceptionsMap = {
    timedOutException: {
      'value': localizations.serverNotReachable,
    },
  };

  void showException([String? error]) {
    final Map<String, dynamic>? exception = exceptionsMap[error];
    Components().snackBar(
      message: error != null && exception != null
          ? exception['value'] ?? localizations.somethingWrongTryAgain
          : localizations.somethingWrongTryAgain,
      snackBarStatus: exception != null
          ? exception['snackBarStatus'] ?? SnackBarStatus.error
          : SnackBarStatus.error,
    );
  }

  void checkTimedOut(int statusCode) {
    if (statusCode == 408) throw timedOutException;
  }
}

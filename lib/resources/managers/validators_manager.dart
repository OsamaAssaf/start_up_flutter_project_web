import '../../main.dart';

class ValidatorsManager {
  static String? validateEmail(String? value) {
    final RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$');
    if (value == null || value.isEmpty) {
      return localizations.pleaseEnterEmail;
    }
    if (!regex.hasMatch(value)) {
      return localizations.invalidEmail;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    final RegExp uppercasePattern = RegExp(r'(?=.*[A-Z])');
    final RegExp lowercasePattern = RegExp(r'(?=.*[a-z])');
    final RegExp numberPattern = RegExp(r'(?=.*[0-9])');
    final RegExp symbolPattern = RegExp(r'(?=.*?[!@#\$&*~])');
    if (value == null || value.isEmpty) {
      return localizations.pleaseEnterPassword;
    }
    if (uppercasePattern.hasMatch(value) && lowercasePattern.hasMatch(value)) {
      return localizations.passwordMustContainUpperAndLower;
    }
    if (numberPattern.hasMatch(value)) {
      return localizations.passwordMustContainNumber;
    }
    if (symbolPattern.hasMatch(value)) {
      return localizations.passwordMustContainSymbol;
    }
    if (value.length < 8) {
      return localizations.passwordMustBeMoreThatEight;
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return localizations.pleaseEnterConfirmPassword;
    }
    if (value != password) {
      return localizations.passwordDoesNotMatch;
    }
    return null;
  }

  static String? validatePhone(String? value) {
    final RegExp regex = RegExp(r'^\+?[0-9]{8,}$');
    if (value == null || value.isEmpty) {
      return localizations.pleaseEnterPhone;
    }
    if (!regex.hasMatch(value)) {
      return localizations.invalidPhoneNumber;
    }
    return null;
  }

  static String? validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return localizations.fieldRequired;
    }
    return null;
  }

  // static String? validateName(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'pleaseEnterName';
  //   }
  //   return null;
  // }
  //
  // static String? validateDateOfBirth(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'pleaseChooseYourDateOfBirth';
  //   }
  //   return null;
  // }
  //
  // static String? validateGender(int? value) {
  //   if (value == null) {
  //     return 'pleaseChooseYourGender';
  //   }
  //   return null;
  // }
  //
  // static String? validateNationality(String? value) {
  //   if (value == null) {
  //     return 'pleaseChooseYourNationality';
  //   }
  //   return null;
  // }
  //
  // static String? validateCountry(String? value) {
  //   if (value == null) {
  //     return 'pleaseChooseYourCountry';
  //   }
  //   return null;
  // }
  //
  // static String? validateCity(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'pleaseEnterCityState';
  //   }
  //   return null;
  // }
  //
  // static String? validateFeedback(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'pleaseEnterYourFeedback';
  //   }
  //   return null;
  // }
}

import '../helpers/all_imports.dart';

class ValidatorsManager {
  ValidatorsManager._();

  static final ValidatorsManager _instance = ValidatorsManager._();
  factory ValidatorsManager() => _instance;
  String? validateEmail(String? value) {
    final RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$');
    if (value == null || value.isEmpty) {
      return localizations.pleaseEnterEmail;
    }
    if (!regex.hasMatch(value)) {
      return localizations.invalidEmail;
    }
    return null;
  }

  String? validatePassword(String? value) {
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

  String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return localizations.pleaseEnterConfirmPassword;
    }
    if (value != password) {
      return localizations.passwordDoesNotMatch;
    }
    return null;
  }

  String? validatePhone(String? value) {
    final RegExp regex = RegExp(r'^\+?[0-9]{8,}$');
    if (value == null || value.isEmpty) {
      return localizations.pleaseEnterPhone;
    }
    if (!regex.hasMatch(value)) {
      return localizations.invalidPhoneNumber;
    }
    return null;
  }

  String? validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return localizations.fieldRequired;
    }
    return null;
  }

//  String? validateName(String? value) {
//   if (value == null || value.isEmpty) {
//     return 'pleaseEnterName';
//   }
//   return null;
// }
//
//  String? validateDateOfBirth(String? value) {
//   if (value == null || value.isEmpty) {
//     return 'pleaseChooseYourDateOfBirth';
//   }
//   return null;
// }
//
//  String? validateGender(int? value) {
//   if (value == null) {
//     return 'pleaseChooseYourGender';
//   }
//   return null;
// }
//
//  String? validateNationality(String? value) {
//   if (value == null) {
//     return 'pleaseChooseYourNationality';
//   }
//   return null;
// }
//
//  String? validateCountry(String? value) {
//   if (value == null) {
//     return 'pleaseChooseYourCountry';
//   }
//   return null;
// }
//
//  String? validateCity(String? value) {
//   if (value == null || value.isEmpty) {
//     return 'pleaseEnterCityState';
//   }
//   return null;
// }
//
//  String? validateFeedback(String? value) {
//   if (value == null || value.isEmpty) {
//     return 'pleaseEnterYourFeedback';
//   }
//   return null;
// }
}

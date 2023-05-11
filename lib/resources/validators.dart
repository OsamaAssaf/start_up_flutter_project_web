class Validator {
  String? emailValid(String email) {
    RegExp regex =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$');
    if (email.isEmpty) {
      return 'Please enter email';
    } else {
      if (!regex.hasMatch(email)) {
        return 'Please enter correct email';
      } else {
        return null;
      }
    }
  }

  String? validatePassword(String pass) {
    final uppercasePattern = RegExp(r'(?=.*[A-Z])');
    final lowercasePattern = RegExp(r'(?=.*[a-z])');
    final numberPattern = RegExp(r'(?=.*[0-9])');
    final symbolPattern = RegExp(r'(?=.*?[!@#\$&*~])');
    //RegExp regex =RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (uppercasePattern.hasMatch(pass) && lowercasePattern.hasMatch(pass)) {
      return 'password must contain at least one uppercase and one lowercase letter';
    } else if (numberPattern.hasMatch(pass)) {
      return 'password must contain at least one number';
    } else if (symbolPattern.hasMatch(pass)) {
      return 'password must contain at least one symbol';
    } else if (pass.length < 6) {
      return 'Must be equal or more  than 6 charater';
    }else if (pass.isEmpty) {
      return 'Please enter password';
    } else {
        return null;
    }
  }

  String? validatePhone(String phone) {
    RegExp regex = RegExp(r'^\+?[0-9]{8,}$');
    if (phone.isEmpty) {
      return 'Please enter phone';
    } else {
      if (!regex.hasMatch(phone)) {
        return 'Please enter correct phone';
      } else {
        return null;
      }
    }
  }
}

class Validator{

String? emailValid(String email) {
    RegExp regex =RegExp(r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$');
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
    RegExp regex =RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (pass.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(pass)) {
        return 'Please enter correct email';
      } else {
        return null;
      }
    }
  }

String? validatePhone(String phone) {
    RegExp regex =RegExp(r'^\+?[0-9]{8,}$');
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
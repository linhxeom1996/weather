import '../enum/password_type.dart';

class UserValidate {
  bool emailValid(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  PasswordCase passValid(String password) {
    if (password.length < 8) {
      return PasswordCase.short;
    } else {
      RegExp reglowUpper = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])');
      if (!reglowUpper.hasMatch(password)) {
        return PasswordCase.lowercase;
      } else {
        RegExp symbol = RegExp(r'^(?=.*?[%@#$])');
        if (!symbol.hasMatch(password)) {
          return PasswordCase.symbol;
        }
      }
    }
    return PasswordCase.valid;
  }

  bool phoneValid(String phone) {
    return RegExp(r"^(?:[+0]9)?[0-9]{10}$").hasMatch(phone);
  }

  bool nameValid(String name) {
    if (name.length >= 3) {
      return !RegExp(r"\d").hasMatch(name);
    }
    return false;
  }

  bool addressValid(String address) {
    if (address.length >= 5) {
      return true;
    }
    return false;
  }
}

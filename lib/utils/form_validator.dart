import 'package:get/get.dart';

class FormValidator {
  static String? nameValidator(String? value) {
    if (value!.isEmpty) return "Please enter a name";
    if (!RegExp(r"[a-zA-Z]+").hasMatch(value))
      return "Please enter a valid name";
    return null;
  }

  static String? usernameValidator(String? value) {
    if (value!.isEmpty) return "Please enter username";
    if (value.length < 5) return "Username must be at least 5 chars long";
    return null;
  }

  static String? emailValidator(String? value) {
    if (value!.isEmpty) return "Please enter an E-mail";
    if (GetUtils.isEmail(value)) return "Please enter a valid email address";
    return null;
  }

  static String? passwordValidtor(String? value) {
    if (value!.isEmpty) return "Please enter a password";
    if (value.length < 8) return "Password must be at least 8 chars long";
    return null;
  }
}

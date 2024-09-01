import 'package:get/get.dart';

class FormValidator {
  static String? nameValidator(String? value) {
    if (value!.isEmpty) return "pleaseEnterName".tr;
    if (!RegExp(r"[a-zA-Z]+").hasMatch(value)) return "pleaseEnterValidName".tr;
    return null;
  }

  static String? usernameValidator(String? value) {
    if (value!.isEmpty) return "pleaseEnterUsername".tr;
    if (value.length < 5) return "pleaseEnterValidUsernameLen".tr;
    if (!RegExp(r"[a-zA-Z0-9_]").hasMatch(value))
      return "pleaseEnterValidUsername".tr;
    return null;
  }

  static String? emailValidator(String? value) {
    if (value!.isEmpty) return "pleaseEnterEmail".tr;
    if (!GetUtils.isEmail(value)) return "pleaseEnterValidEmail".tr;
    return null;
  }

  static String? passwordValidtor(String? value) {
    if (value!.isEmpty) return "pleaseEnterPassword".tr;
    if (value.length < 8) return "pleaseEnterValidPassword".tr;
    return null;
  }
}

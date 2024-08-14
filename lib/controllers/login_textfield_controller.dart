import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginTextfieldController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final showPassword = false.obs;

  void toggleShowPassword() {
    showPassword.value = !showPassword.value;
  }

  @override
  void onClose() {
    super.onClose();
    passwordController.dispose();
    emailController.dispose();
  }
}

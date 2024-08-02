import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxString selectedTheme = "system".obs;

  void updateTheme(String theme) {
    selectedTheme.value = theme;
    if (theme == 'system') {
      Get.changeThemeMode(ThemeMode.system);
    } else if (theme == 'light') {
      Get.changeThemeMode(ThemeMode.light);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
    }
  }
}

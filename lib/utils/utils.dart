import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

ThemeMode getThemeMode() {
  final storage = GetStorage();
  if (storage.read("isDarkMode") == null) {
    return ThemeMode.system;
  } else if (storage.read("isDarkMode")) {
    return ThemeMode.dark;
  }
  return ThemeMode.light;
}

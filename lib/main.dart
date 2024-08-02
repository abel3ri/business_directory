import 'package:business_directory/controllers/theme_controller.dart';
import 'package:business_directory/pages/home_page.dart';
import 'package:business_directory/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(ThemeController());
  final storage = GetStorage();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: storage.read("isDarkMode") == null
          ? ThemeMode.system
          : storage.read("isDarkMode")
              ? ThemeMode.dark
              : ThemeMode.light,
      darkTheme: AppTheme.darkTheme,
      defaultTransition: Transition.cupertino,
      initialRoute: "/home",
      getPages: [
        GetPage(
          name: "/home",
          page: () => HomePage(),
        ),
      ],
      // themeMode: ,
    ),
  );
}

import 'package:business_directory/controllers/theme_controller.dart';
import 'package:business_directory/l10n/app_translations.dart';
import 'package:business_directory/pages/get_started_page.dart';
import 'package:business_directory/pages/home_page.dart';
import 'package:business_directory/pages/login_page.dart';
import 'package:business_directory/pages/signup_page.dart';
import 'package:business_directory/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(ThemeController());
  final storage = GetStorage();
  final bool? isDarkMode = storage.read("isDarkMode");
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: isDarkMode == null
          ? ThemeMode.system
          : isDarkMode
              ? ThemeMode.dark
              : ThemeMode.light,
      darkTheme: AppTheme.darkTheme,
      translations: AppTranslations(),
      locale: Locale("en", "US"),
      fallbackLocale: Locale("en", "US"),
      defaultTransition: Transition.cupertino,
      initialRoute: "/getStarted",
      getPages: [
        GetPage(
          name: "/getStarted",
          page: () => GetStartedPage(),
        ),
        GetPage(
          name: "/home",
          page: () => HomePage(),
        ),
        GetPage(
          name: "/login",
          page: () => LoginPage(),
        ),
        GetPage(
          name: "/signup",
          page: () => SignupPage(),
        ),
      ],
      // themeMode: ,
    ),
  );
}

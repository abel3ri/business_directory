import 'package:business_directory/controllers/theme_controller.dart';
import 'package:business_directory/pages/home_page.dart';
import 'package:business_directory/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ThemeController());
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.system,
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

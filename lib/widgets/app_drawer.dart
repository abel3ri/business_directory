import 'package:business_directory/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({
    super.key,
  });

  final ThemeController themeController = Get.find<ThemeController>();
  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      width: Get.width * 0.8,
      shape: RoundedRectangleBorder(),
      child: SafeArea(
        child: Column(
          children: [
            Text(
              "settings".tr,
              style: Get.textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Get.theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

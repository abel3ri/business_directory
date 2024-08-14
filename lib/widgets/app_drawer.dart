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
      width: Get.width * 0.8,
      shape: RoundedRectangleBorder(),
      child: SafeArea(
        child: Column(
          children: [
            Text(
              "settings".tr,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: Text("darkMode".tr),
                  trailing: Obx(
                    () => Transform.scale(
                      scale: 0.8,
                      child: Switch(
                        value: themeController.isDarkMode.value,
                        onChanged: (value) async {
                          themeController.isDarkMode.value = value;
                          Get.changeThemeMode(
                            value ? ThemeMode.dark : ThemeMode.light,
                          );
                          await storage.write("isDarkMode", value);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

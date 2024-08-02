import 'package:business_directory/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({
    super.key,
  });

  final ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Get.width * 0.8,
      shape: RoundedRectangleBorder(),
      child: SafeArea(
        child: Column(
          children: [
            Text("Business Directory"),
            ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: Text("Theme"),
                  trailing: Theme(
                    data: Theme.of(context).copyWith(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                    child: Obx(
                      () => DropdownButton(
                        value: themeController.selectedTheme.value,
                        underline: SizedBox.shrink(),
                        alignment: Alignment.centerRight,
                        elevation: 0,
                        items: [
                          DropdownMenuItem(
                            child: Text("Light"),
                            value: "light",
                          ),
                          DropdownMenuItem(
                            child: Text("Dark"),
                            value: "dark",
                          ),
                          DropdownMenuItem(
                            child: Text("System"),
                            value: "system",
                          ),
                        ],
                        onChanged: (value) {
                          themeController.updateTheme(value!);
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

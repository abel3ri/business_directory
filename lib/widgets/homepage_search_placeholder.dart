import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageSearchPlaceHolder extends StatelessWidget {
  const HomePageSearchPlaceHolder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed("search");
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: Get.isDarkMode
                ? Get.theme.scaffoldBackgroundColor.lighten(10)
                : Get.theme.scaffoldBackgroundColor.darken(10),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            width: Get.width * 0.9,
            height: 48,
            color: Get.isDarkMode
                ? Get.theme.scaffoldBackgroundColor.lighten(20)
                : Get.theme.scaffoldBackgroundColor.lighten(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Search Business...",
                  style: Get.textTheme.bodyLarge,
                ),
                Icon(
                  Icons.search,
                  size: 32,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

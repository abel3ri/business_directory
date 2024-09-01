import 'package:business_directory/controllers/home_controller.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageSearchInput extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  HomePageSearchInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: Get.isDarkMode
              ? Get.theme.scaffoldBackgroundColor.lighten(10)
              : Get.theme.scaffoldBackgroundColor.darken(10),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          controller: homeController.searchInputController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            hintText: "searchBusiness".tr,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Get.isDarkMode
                ? Get.theme.scaffoldBackgroundColor.lighten(20)
                : Get.theme.scaffoldBackgroundColor.lighten(10),
          ),
          onChanged: (value) {},
        ),
      ),
    );
  }
}

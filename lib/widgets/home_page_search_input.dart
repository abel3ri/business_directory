import 'package:business_directory/controllers/search_controller.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart' hide SearchController;
import 'package:get/get.dart';

class HomePageSearchInput extends StatelessWidget {
  final searchController = Get.find<SearchController>();
  HomePageSearchInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: searchController.searchInputController,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          hintText: "searchBusiness".tr,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Get.theme.primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(
              color: Get.theme.primaryColor,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(
              color: Get.theme.primaryColor,
              width: 2,
            ),
          ),
          filled: true,
          fillColor: Get.isDarkMode
              ? Get.theme.scaffoldBackgroundColor.lighten(20)
              : Get.theme.scaffoldBackgroundColor.lighten(10),
        ),
        textInputAction: TextInputAction.search,
        onChanged: (value) {
          searchController.searchBusinesses(query: value).then((res) {
            res.fold((l) {
              l.showError();
            }, (r) {});
          });
        },
      ),
    );
  }
}

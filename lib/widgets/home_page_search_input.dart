import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageInputController extends GetxController {
  TextEditingController searchInputController = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    searchInputController.dispose();
  }
}

class HomePageSearchInput extends StatelessWidget {
  final controller = Get.put(HomePageInputController());
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
          color: Theme.of(context).scaffoldBackgroundColor.lighten(10),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          controller: controller.searchInputController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            hintText: "Search businesses",
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
                ? Colors.grey.darken(50)
                : Colors.grey.lighten(20),
          ),
          onChanged: (value) {},
        ),
      ),
    );
  }
}

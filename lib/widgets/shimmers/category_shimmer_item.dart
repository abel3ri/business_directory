import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmerItem extends StatelessWidget {
  const CategoryShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          child: Shimmer.fromColors(
            baseColor: Get.isDarkMode
                ? Get.theme.scaffoldBackgroundColor.lighten(25)
                : Get.theme.scaffoldBackgroundColor.darken(25),
            highlightColor: Get.isDarkMode
                ? Get.theme.scaffoldBackgroundColor.lighten(5)
                : Get.theme.scaffoldBackgroundColor.darken(5),
            child: Icon(
              Icons.business,
              color: Colors.white,
            ),
          ),
          backgroundColor: Get.isDarkMode
              ? Get.theme.scaffoldBackgroundColor.lighten(25)
              : Get.theme.scaffoldBackgroundColor.darken(25),
        ),
        SizedBox(height: 4),
        Shimmer.fromColors(
          baseColor: Get.textTheme.bodyMedium!.color!,
          highlightColor: Get.isDarkMode
              ? Get.theme.scaffoldBackgroundColor.lighten(5)
              : Get.theme.scaffoldBackgroundColor.darken(5),
          child: Text(
            "Business",
          ),
        ),
      ],
    );
  }
}

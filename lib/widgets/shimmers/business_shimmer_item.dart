import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class BusinessShimmerItem extends StatelessWidget {
  const BusinessShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.45,
      height: Get.height * 0.28,
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? Get.theme.scaffoldBackgroundColor.darken(5)
            : Get.theme.scaffoldBackgroundColor.lighten(10),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 4, right: 4),
        child: Column(
          children: [
            Center(
              child: Shimmer.fromColors(
                baseColor: Get.isDarkMode
                    ? Get.theme.scaffoldBackgroundColor.darken(10)
                    : Get.theme.scaffoldBackgroundColor.lighten(10),
                highlightColor: Get.isDarkMode
                    ? Get.theme.scaffoldBackgroundColor.lighten(5)
                    : Get.theme.scaffoldBackgroundColor.darken(5),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Get.isDarkMode
                      ? Get.theme.scaffoldBackgroundColor.lighten(5)
                      : Get.theme.scaffoldBackgroundColor.darken(5),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.01),
            Shimmer.fromColors(
              baseColor: Get.isDarkMode
                  ? Get.theme.scaffoldBackgroundColor.darken(10)
                  : Get.theme.scaffoldBackgroundColor.lighten(10),
              highlightColor: Get.isDarkMode
                  ? Get.theme.scaffoldBackgroundColor.lighten(5)
                  : Get.theme.scaffoldBackgroundColor.darken(5),
              child: RContainerPlaceholder(
                width: Get.width * 0.2,
                height: 16,
              ),
            ),
            SizedBox(height: Get.height * 0.01),
            Shimmer.fromColors(
              baseColor: Get.isDarkMode
                  ? Get.theme.scaffoldBackgroundColor.darken(10)
                  : Get.theme.scaffoldBackgroundColor.lighten(10),
              highlightColor: Get.isDarkMode
                  ? Get.theme.scaffoldBackgroundColor.lighten(5)
                  : Get.theme.scaffoldBackgroundColor.darken(5),
              child: RContainerPlaceholder(
                width: Get.width * 0.4,
                height: 12,
              ),
            ),
            SizedBox(height: Get.height * 0.01),
            Shimmer.fromColors(
              baseColor: Get.isDarkMode
                  ? Get.theme.scaffoldBackgroundColor.darken(10)
                  : Get.theme.scaffoldBackgroundColor.lighten(10),
              highlightColor: Get.isDarkMode
                  ? Get.theme.scaffoldBackgroundColor.lighten(5)
                  : Get.theme.scaffoldBackgroundColor.darken(5),
              child: RContainerPlaceholder(
                width: Get.width * 0.4,
                height: 12,
              ),
            ),
            SizedBox(height: Get.height * 0.01),
            Shimmer.fromColors(
              baseColor: Get.isDarkMode
                  ? Get.theme.scaffoldBackgroundColor.darken(10)
                  : Get.theme.scaffoldBackgroundColor.lighten(10),
              highlightColor: Get.isDarkMode
                  ? Get.theme.scaffoldBackgroundColor.lighten(5)
                  : Get.theme.scaffoldBackgroundColor.darken(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CategoryPlaceholder(),
                  SizedBox(width: Get.width * 0.01),
                  CategoryPlaceholder(),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.01),
            Icon(Icons.star_rounded, color: Get.theme.primaryColor),
          ],
        ),
      ),
    );
  }
}

class RContainerPlaceholder extends StatelessWidget {
  const RContainerPlaceholder({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Get.isDarkMode
          ? Get.theme.scaffoldBackgroundColor.lighten(5)
          : Get.theme.scaffoldBackgroundColor.darken(5),
    );
  }
}

class CategoryPlaceholder extends StatelessWidget {
  const CategoryPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Get.isDarkMode
            ? Get.theme.scaffoldBackgroundColor.lighten(5)
            : Get.theme.scaffoldBackgroundColor.darken(5),
      ),
    );
  }
}

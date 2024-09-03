import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessProfileCard extends StatelessWidget {
  final String? logoUrl;
  final String name;
  final bool isVerified;
  final String description;
  final String tag;

  BusinessProfileCard({
    required this.logoUrl,
    required this.name,
    required this.description,
    required this.isVerified,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Get.isDarkMode
              ? Get.theme.scaffoldBackgroundColor.darken(5)
              : Get.theme.scaffoldBackgroundColor.lighten(10),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Hero(
                    tag: tag,
                    child: FadeInImage.assetNetwork(
                      placeholder: "assets/image.png",
                      image: logoUrl!,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/image.png",
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: Get.width * 0.04),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: Get.textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        description,
                        style: Get.textTheme.bodyLarge,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isVerified)
          Positioned(
            top: 0,
            right: 0,
            child: Icon(
              Icons.verified_rounded,
              color: Get.theme.colorScheme.primary,
              size: 32,
            ),
          ),
      ],
    );
  }
}

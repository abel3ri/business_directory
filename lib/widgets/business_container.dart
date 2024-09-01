import 'package:business_directory/models/business.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessContainer extends StatelessWidget {
  const BusinessContainer({
    super.key,
    required this.business,
    required this.onPressed,
  });

  final Business business;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          "business-details-page",
          arguments: {
            "business": business,
          },
        );
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Get.isDarkMode
            ? Get.theme.scaffoldBackgroundColor.darken(5)
            : Get.theme.scaffoldBackgroundColor.lighten(10),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 4, right: 4),
          child: Column(
            children: [
              SizedBox(
                height: 64,
                width: 64,
                child: Hero(
                  tag: business.name,
                  child: Image.network(
                    business.logo!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.01),
              Text(
                business.name,
                overflow: TextOverflow.ellipsis,
                style: Get.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: Get.height * 0.01),
              Text(
                '${business.description}',
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Get.textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(),
              Chip(
                shape: StadiumBorder(),
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.all(0),
                side: BorderSide.none,
                label: Text(
                  "tech",
                  overflow: TextOverflow.ellipsis,
                  style: Get.textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 8,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${business.averageRating ?? "No ratings"}",
                    style: Get.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.star_rounded,
                    size: 16,
                    color: Get.theme.colorScheme.primary,
                  ),
                ],
              ),
              Divider(),
              Spacer(),
              Text(
                '${business.address}',
                overflow: TextOverflow.ellipsis,
                style: Get.textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              // Spacer(),
              TextButton.icon(
                label: Text(
                  "showDirection".tr,
                  style: Get.textTheme.bodySmall,
                ),
                onPressed: onPressed,
                iconAlignment: IconAlignment.end,
                icon: Icon(Icons.directions),
              )
            ],
          ),
        ),
      ),
    );
  }
}

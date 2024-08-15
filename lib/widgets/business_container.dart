import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessContainer extends StatelessWidget {
  const BusinessContainer({
    super.key,
    required this.imagePath,
    required this.name,
    required this.location,
    required this.rating,
    required this.shortDescription,
    required this.category,
  });

  final String imagePath;
  final String name;
  final double rating;
  final String shortDescription;
  final String location;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Get.isDarkMode
          ? Theme.of(context).scaffoldBackgroundColor.darken(5)
          : Theme.of(context).scaffoldBackgroundColor.lighten(10),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
            SizedBox(height: Get.height * 0.01),
            Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            SizedBox(height: Get.height * 0.01),
            Text(
              '"${shortDescription}"',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
                category.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 8,
                    ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${rating}",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Icon(
                  Icons.star_rounded,
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
            Divider(),
            Spacer(),
            Text(
              '${location}',
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            // Spacer(),
            TextButton.icon(
              label: Text(
                "showDirection".tr,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onPressed: () {},
              iconAlignment: IconAlignment.end,
              icon: Icon(Icons.directions),
            )
          ],
        ),
      ),
    );
  }
}

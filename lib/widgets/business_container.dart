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
  });

  final String imagePath;
  final String name;
  final double rating;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? Theme.of(context).scaffoldBackgroundColor.lighten(5)
            : Theme.of(context).scaffoldBackgroundColor.darken(5),
        borderRadius: BorderRadius.circular(8),
      ),
      // color: Colors.grey,
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 96,
            height: 96,
          ),
          SizedBox(height: Get.height * 0.01),
          Text(
            name,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: Get.height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Chip(
                shape: StadiumBorder(),
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.all(0),
                side: BorderSide.none,
                label: Text(
                  "TECH",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Text(
                "${rating}⭐",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          Text(
            '🎈 ${location}',
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
    );
  }
}

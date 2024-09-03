import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:business_directory/controllers/home_controller.dart';
import 'package:business_directory/models/business.dart'; // Adjust the import based on your models
import 'package:business_directory/widgets/business_container.dart'; // Adjust if needed

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    return Obx(
      () {
        if (homeController.favorites.isEmpty) {
          return Center(child: Text("No favorites added yet."));
        }
        return ListView.builder(
          itemCount: homeController.favorites.length,
          itemBuilder: (context, index) {
            final business = homeController.favorites[index];
            return BusinessContainer(
              tag: "f${business.name}", // Adjust based on your implementation
              business: business,
              onShowDirectionTap: () {
                // Implement your navigation to show directions
              },
            );
          },
        );
      },
    );
  }
}

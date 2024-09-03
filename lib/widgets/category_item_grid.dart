import 'package:business_directory/controllers/category_controller.dart';
import 'package:business_directory/utils/utils.dart';
import 'package:business_directory/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class CategoryItemsGrid extends StatelessWidget {
  final categoryContoller = Get.find<CategoryController>();
  CategoryItemsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Obx(
        () => MasonryGridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: categoryContoller.categories.value.length,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemBuilder: (context, index) {
            final category = categoryContoller.categories.value[index];
            return CategoryItem(
              onTap: () {},
              name: category.name,
              icon: Icons.business,
              color: getCategoryItemColor(index),
            );
          },
        ),
      ),
    );
  }
}

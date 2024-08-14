import 'package:business_directory/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItemsGrid extends StatelessWidget {
  const CategoryItemsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: GridView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 4,
        ),
        children: [
          CategoryItem(
            name: "restaurant".tr,
            icon: Icons.restaurant,
            color: Colors.red,
            onTap: () {},
          ),
          CategoryItem(
            name: "realEstate".tr,
            icon: Icons.home,
            color: Colors.amber,
            onTap: () {},
          ),
          CategoryItem(
            name: "tech".tr,
            icon: Icons.developer_mode,
            color: Colors.blue,
            onTap: () {},
          ),
          CategoryItem(
            name: "shopping".tr,
            icon: Icons.shopping_bag,
            onTap: () {},
          ),
          CategoryItem(
            name: "hospital".tr,
            icon: Icons.local_hospital,
            color: Colors.green,
            onTap: () {},
          ),
          CategoryItem(
            name: "pharmacy".tr,
            icon: Icons.medication_liquid_rounded,
            color: Colors.lightGreen,
            onTap: () {},
          ),
          CategoryItem(
            name: "Shopping".tr,
            icon: Icons.shopping_bag,
            color: Colors.purple,
            onTap: () {},
          ),
          CategoryItem(
            name: "more".tr,
            icon: Icons.more_vert_outlined,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

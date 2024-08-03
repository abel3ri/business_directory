import 'package:business_directory/widgets/category_item.dart';
import 'package:flutter/material.dart';

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
            name: "Restaurant",
            icon: Icons.restaurant,
            color: Colors.red,
            onTap: () {},
          ),
          CategoryItem(
            name: "Real Estate",
            icon: Icons.home,
            color: Colors.amber,
            onTap: () {},
          ),
          CategoryItem(
            name: "Tech",
            icon: Icons.developer_mode,
            color: Colors.blue,
            onTap: () {},
          ),
          CategoryItem(
            name: "Shopping",
            icon: Icons.shopping_bag,
            onTap: () {},
          ),
          CategoryItem(
            name: "Hospital",
            icon: Icons.local_hospital,
            color: Colors.green,
            onTap: () {},
          ),
          CategoryItem(
            name: "Pharmacy",
            icon: Icons.medication_liquid_rounded,
            color: Colors.lightGreen,
            onTap: () {},
          ),
          CategoryItem(
            name: "Shopping",
            icon: Icons.shopping_bag,
            color: Colors.purple,
            onTap: () {},
          ),
          CategoryItem(
            name: "More",
            icon: Icons.more_vert_outlined,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

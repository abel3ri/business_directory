import 'package:business_directory/widgets/shimmers/category_shimmer_item.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';

class CategoryShimmerGrid extends StatelessWidget {
  const CategoryShimmerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 8),
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 8,
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemBuilder: (context, index) {
        return CategoryShimmerItem();
      },
    );
  }
}

import 'package:business_directory/widgets/shimmers/business_shimmer_item.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';

class BusinessShimmerGrid extends StatelessWidget {
  const BusinessShimmerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 8),
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return BusinessShimmerItem();
      },
    );
  }
}

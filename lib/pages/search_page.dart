import 'package:business_directory/controllers/home_controller.dart';
import 'package:business_directory/controllers/search_controller.dart';
import 'package:business_directory/services/location_service.dart';
import 'package:business_directory/widgets/business_container.dart';
import 'package:business_directory/widgets/custom_app_bar.dart';
import 'package:business_directory/widgets/home_page_search_input.dart';
import 'package:business_directory/widgets/shimmers/business_shimmer_grid.dart';
import 'package:flutter/material.dart' hide SearchController;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  final searchController = Get.put(SearchController());

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: HomePageSearchInput(),
        bottomRenderCondtion: homeController.isLoading,
      ),
      body: Obx(
        () => Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: searchController.isLoading.value
              ? BusinessShimmerGrid()
              : MasonryGridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: searchController.searchResults.value.length,
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    final business =
                        searchController.searchResults.value[index];
                    return BusinessContainer(
                      tag: "s${business.name}",
                      business: business,
                      onShowDirectionTap: () async {
                        homeController.toggleIsLoading();
                        final res =
                            await LocationService().getCurrentPosition();
                        homeController.toggleIsLoading();
                        res.fold(
                          (l) {
                            l.showError();
                          },
                          (r) {
                            homeController.toggleIsLoading();
                            homeController.setUserPosition(r);
                            homeController.toggleIsLoading();
                            Get.toNamed("/map", arguments: {
                              "businessCoords": business.latLng,
                              "name": business.name,
                              "tag": "s${business.name}",
                            });
                          },
                        );
                      },
                    );
                  },
                ),
        ),
      ),
    );
  }
}

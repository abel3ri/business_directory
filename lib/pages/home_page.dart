import 'package:business_directory/controllers/home_controller.dart';
import 'package:business_directory/services/location_service.dart';
import 'package:business_directory/widgets/app_drawer.dart';
import 'package:business_directory/widgets/business_container.dart';
import 'package:business_directory/widgets/category_item_grid.dart';
import 'package:business_directory/widgets/custom_app_bar.dart';
import 'package:business_directory/widgets/homepage_search_placeholder.dart';
import 'package:business_directory/widgets/shimmers/business_shimmer_grid.dart';
import 'package:business_directory/widgets/shimmers/category_shimmer_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: AppDrawer(),
      appBar: CustomAppBar(
        bottomRenderCondtion: homeController.isLoading,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.sort),
            );
          },
        ),
        actions: [
          PopupMenuButton(
            surfaceTintColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            position: PopupMenuPosition.under,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: "en_US",
                child: Text("English"),
              ),
              PopupMenuItem(
                value: "am_ET",
                child: Text("አማርኛ"),
              ),
            ],
            icon: Icon(Icons.translate_rounded),
            onSelected: (value) {
              List<String> splittedLocale = value.split("_");
              Locale locale = Locale(splittedLocale[0], splittedLocale[1]);
              Get.updateLocale(locale);
            },
          ),
        ],
        title: Text("businessDirectory".tr),
      ),
      body: RefreshIndicator(
        onRefresh: () => homeController.fetchData(),
        child: SingleChildScrollView(
          physics:
              AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Center(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment(0, 1.25),
                  children: [
                    Container(
                      width: Get.width,
                      height: Get.height * 0.3,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Get.theme.colorScheme.primary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: Text.rich(
                          TextSpan(
                            text: "discover".tr,
                            style: Get.textTheme.headlineMedium!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                            children: [
                              TextSpan(
                                text: "localBusiness".tr,
                                style: Get.textTheme.headlineMedium!.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(child: HomePageSearchPlaceHolder()),
                  ],
                ),
                SizedBox(height: Get.height * 0.06),
                Divider(),
                SizedBox(height: Get.height * 0.02),
                Obx(() {
                  return homeController.categoryController.isLoading.value
                      ? CategoryShimmerGrid()
                      : CategoryItemsGrid();
                }),
                Divider(),
                SizedBox(height: Get.height * 0.02),
                Obx(
                  () {
                    return homeController.businessController.isLoading.value
                        ? BusinessShimmerGrid()
                        : MasonryGridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: homeController
                                .businessController.businesses.value.length,
                            gridDelegate:
                                SliverSimpleGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) {
                              final business = homeController
                                  .businessController.businesses.value[index];
                              return BusinessContainer(
                                tag: "h${business.name}",
                                business: business,
                                onShowDirectionTap: () async {
                                  homeController.toggleIsLoading();
                                  final res = await LocationService()
                                      .getCurrentPosition();
                                  homeController.toggleIsLoading();
                                  res.fold(
                                    (l) {
                                      l.showError();
                                    },
                                    (r) {
                                      homeController.setUserPosition(r);
                                      Get.toNamed("/map", arguments: {
                                        "businessCoords": business.latLng,
                                        "name": business.name,
                                      });
                                    },
                                  );
                                },
                              );
                            },
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

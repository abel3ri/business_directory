import 'package:business_directory/controllers/home_controller.dart';
import 'package:business_directory/pages/profile_page.dart';
import 'package:business_directory/services/location_service.dart';
import 'package:business_directory/widgets/app_drawer.dart';
import 'package:business_directory/widgets/business_container.dart';
import 'package:business_directory/widgets/category_item_grid.dart';
import 'package:business_directory/widgets/custom_app_bar.dart';
import 'package:business_directory/widgets/home_page_search_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final homeController = Get.put(HomeController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      RefreshIndicator(
        onRefresh: () => homeController.businessController.getBusinesses(),
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
                    Positioned(
                      child: HomePageSearchInput(),
                    ),
                  ],
                ),
                SizedBox(height: Get.height * 0.06),
                Divider(),
                SizedBox(height: Get.height * 0.02),
                CategoryItemsGrid(),
                Divider(),
                SizedBox(height: Get.height * 0.02),
                Obx(
                  () => GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 0,
                      childAspectRatio: 0.55,
                    ),
                    itemCount: homeController
                        .businessController.businesses.value.length,
                    itemBuilder: (context, index) {
                      final business = homeController
                          .businessController.businesses.value[index];
                      return BusinessContainer(
                        business: business,
                        onPressed: () async {
                          homeController.toggleIsLoading();
                          final res =
                              await LocationService().getCurrentPosition();
                          homeController.toggleIsLoading();
                          res.fold(
                            (l) {
                              l.showError();
                            },
                            (r) {
                              homeController.setUserPosition(r);
                              Get.toNamed("/map", arguments: {
                                "businessCoords": business.latLng,
                              });
                            },
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      Center(
        child: Text("Search"),
      ),
      Center(
        child: Text("Favorites"),
      ),
      ProfilePage(),
    ];
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded),
              label: "Favorites",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Proifle",
            ),
          ],
          currentIndex: homeController.index.value,
          onTap: (index) {
            homeController.onPageChanged(index);
          },
        ),
      ),
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
      body: Obx(() => items[homeController.index.value]),
    );
  }
}

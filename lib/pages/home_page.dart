import 'package:business_directory/controllers/home_controller.dart';
import 'package:business_directory/pages/profile_page.dart';
import 'package:business_directory/services/location_service.dart';
import 'package:business_directory/widgets/app_drawer.dart';
import 'package:business_directory/widgets/business_container.dart';
import 'package:business_directory/widgets/category_item_grid.dart';
import 'package:business_directory/widgets/home_page_search_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Text.rich(
                        TextSpan(
                          text: "discover".tr,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                              ),
                          children: [
                            TextSpan(
                              text: "localBusiness".tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
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
              SizedBox(height: Get.height * 0.08),
              CategoryItemsGrid(),
              Divider(),
              Center(
                child: Text(
                  "popularBusiness".tr,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              GridView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1 / 2.4,
                ),
                children: [
                  BusinessContainer(
                    imagePath: "assets/eTech_logo.png",
                    name: "eTech S.C.",
                    location: "Around 22, Addis Ababa",
                    shortDescription: "Ethical, Ethiopian, End-to-End",
                    rating: 4.9,
                    category: "tech",
                    onPressed: () {},
                  ),
                  BusinessContainer(
                    imagePath: "assets/ride_logo.png",
                    name: "Ride Meter Taxi",
                    location: "Bole Edna mall, Addis Ababa",
                    shortDescription: "Ethical, Ethiopian, End-to-End",
                    rating: 4.9,
                    category: "meter taxi",
                    onPressed: () {},
                  ),
                  BusinessContainer(
                    imagePath: "assets/sheraton_addis_logo.png",
                    name: "Sheraton Addis",
                    location: "Around 22, Addis Ababa",
                    shortDescription: "a Luxury Collection Hotel",
                    rating: 4.9,
                    category: "hotel and spa",
                    onPressed: () async {
                      homeController.toggleIsLoading();
                      final res = await LocationService().getCurrentPosition();
                      homeController.toggleIsLoading();
                      res.fold((l) {
                        l.showError();
                      }, (r) {
                        homeController.setUserPosition(r);
                        Get.toNamed("/map");
                      });
                    },
                  ),
                ],
              ),
            ],
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
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(8),
            child: Obx(() {
              return homeController.isLoading.value
                  ? LinearProgressIndicator(
                      color: Theme.of(context).colorScheme.secondary,
                    )
                  : SizedBox();
            })),
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
            icon: Icon(Icons.language),
            onSelected: (value) {
              List<String> splittedLocale = value.split("_");
              Locale locale = Locale(splittedLocale[0], splittedLocale[1]);
              Get.updateLocale(locale);
            },
          ),
        ],
        titleTextStyle: Theme.of(context).textTheme.bodyLarge,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Text("businessDirectory".tr),
        centerTitle: true,
      ),
      body: Obx(() => items[homeController.index.value]),
    );
  }
}

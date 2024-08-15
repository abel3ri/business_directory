import 'package:business_directory/controllers/home_page_bottom_nav_controller.dart';
import 'package:business_directory/widgets/app_drawer.dart';
import 'package:business_directory/widgets/business_container.dart';
import 'package:business_directory/widgets/category_item_grid.dart';
import 'package:business_directory/widgets/home_page_search_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final navBarController = Get.put(HomePageBottomNavController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12),
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
              // SizedBox(height: Get.height * 0.02),
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
                  ),
                  BusinessContainer(
                    imagePath: "assets/ride_logo.png",
                    name: "Ride Meter Taxi",
                    location: "Bole Edna mall, Addis Ababa",
                    shortDescription: "Ethical, Ethiopian, End-to-End",
                    rating: 4.9,
                    category: "meter taxi",
                  ),
                  BusinessContainer(
                    imagePath: "assets/sheraton_addis_logo.png",
                    name: "Sheraton Addis",
                    location: "Around 22, Addis Ababa",
                    shortDescription: "a Luxury Collection Hotel",
                    rating: 4.9,
                    category: "hotel and spa",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Center(
        child: Text("Profile"),
      ),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Proifle",
          ),
        ],
        currentIndex: navBarController.index.value,
        onTap: (index) {
          navBarController.onPageChnaged(index);
        },
      ),
      resizeToAvoidBottomInset: false,
      drawer: AppDrawer(),
      appBar: AppBar(
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
      body: Obx(() => items[navBarController.index.value]),
    );
  }
}

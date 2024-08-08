import 'package:business_directory/widgets/app_drawer.dart';
import 'package:business_directory/widgets/business_container.dart';
import 'package:business_directory/widgets/category_item_grid.dart';
import 'package:business_directory/widgets/home_page_search_input.dart';
import 'package:business_directory/widgets/r_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter.add(
                  Alignment(0, 0.45),
                ),
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
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 100,
                          offset: Offset(0, 20),
                          color: Colors.black26,
                        ),
                      ],
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
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  HomePageSearchInput(),
                ],
              ),
              SizedBox(height: Get.height * 0.08),
              CategoryItemsGrid(),
              // SizedBox(height: Get.height * 0.02),
              Divider(),
              Center(
                child: Text(
                  "popularBusiness".tr,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(),
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
                  childAspectRatio: 4.5 / 7,
                ),
                children: [
                  BusinessContainer(
                    imagePath: "assets/eTech_logo.png",
                    name: "eTech S.C.",
                    location: "Around 22, Addis Ababa",
                    rating: 4.9,
                  ),
                  BusinessContainer(
                    imagePath: "assets/eTech_logo.png",
                    name: "eTech S.C.",
                    location: "Around 22, Addis Ababa",
                    rating: 4.9,
                  ),
                  BusinessContainer(
                    imagePath: "assets/eTech_logo.png",
                    name: "eTech S.C.",
                    location: "Around 22, Addis Ababa",
                    rating: 4.9,
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.02),
              Text(
                "signupToExplore".tr,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: Get.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RButton(
                    label: "signup".tr,
                    onPressed: () {
                      Get.toNamed("signup");
                    },
                  ),
                  SizedBox(width: Get.width * 0.02),
                  RButton(
                    label: "login".tr,
                    onPressed: () {
                      Get.toNamed("login");
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

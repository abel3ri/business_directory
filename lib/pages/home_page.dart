import 'package:business_directory/widgets/app_drawer.dart';
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
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {},
          ),
        ],
        titleTextStyle: Theme.of(context).textTheme.bodyLarge,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Text("Business Directory"),
        centerTitle: true,
      ),
      body: Padding(
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
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
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
                          text: "Discover ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                              ),
                          children: [
                            TextSpan(
                              text:
                                  "Local Businesses and Services at Your Fingertips",
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
              Divider(),
              Expanded(child: SizedBox()),
              Text(
                "Sign up or Login to explore more businesses",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: Get.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RButton(
                    label: "Sign up",
                    onPressed: () {
                      Get.toNamed("signup");
                    },
                  ),
                  SizedBox(width: Get.width * 0.02),
                  RButton(
                    label: "Login",
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

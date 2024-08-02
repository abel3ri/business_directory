import 'package:business_directory/widgets/app_drawer.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .scaffoldBackgroundColor
                            .lighten(10),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          hintText: "Search businesses",
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.search),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Get.isDarkMode
                              ? Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .lighten(20)
                              : Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .darken(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // SizedBox(height: Get.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}

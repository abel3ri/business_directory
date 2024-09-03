import 'package:business_directory/controllers/home_controller.dart';
import 'package:business_directory/pages/home_page.dart';
import 'package:business_directory/pages/profile_page.dart';
import 'package:business_directory/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeWrapper extends StatelessWidget {
  final homeController = Get.put(HomeController());
  HomeWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      HomePage(),
      SearchPage(),
      Center(child: Text("Favorites")),
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
      body: Obx(
        () => IndexedStack(
          index: homeController.index.value,
          children: _pages,
        ),
      ),
    );
  }
}

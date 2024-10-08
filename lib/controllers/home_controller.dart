import 'package:business_directory/controllers/auth_controller.dart';
import 'package:business_directory/controllers/business_controller.dart';
import 'package:business_directory/controllers/category_controller.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:business_directory/models/business.dart'; // Adjust import based on your model

class HomeController extends GetxController {
  Rx<int> index = 0.obs;
  var favorites = <Business>[].obs; // List to hold favorite businesses
  Rx<bool> isLoading = false.obs;
  Rx<Position?> userPosition = Rx<Position?>(null);
  late AuthController authController;
  late BusinessController businessController;
  late CategoryController categoryController;

  @override
  void onInit() {
    authController = Get.find<AuthController>();
    FlutterSecureStorage().read(key: "jwtToken").then((val) {
      if (val != null) {
        authController.getUserData().then((res) {
          res.fold((l) {
            l.showError();
          }, (_) {});
        });
      }
    });

    categoryController = Get.put(CategoryController());
    categoryController.fetchCategories().then((res) {
      res.fold((l) {
        l.showError();
      }, (r) {});
    });

    businessController = Get.put(BusinessController());
    businessController.getBusinesses().then((res) {
      res.fold((l) {
        l.showError();
      }, (r) {});
    });

    super.onInit();
  }

  void onPageChanged(int i) {
    if (i != 1 && Get.focusScope!.hasFocus) {
      Get.focusScope!.unfocus();
    }
    index.value = i;
  }

  void toggleIsLoading() {
    isLoading.value = !isLoading.value;
  }

  void setUserPosition(Position position) {
    userPosition.value = position;
  }

  // New methods for managing favorites
  void toggleFavorite(Business business) {
    if (favorites.contains(business)) {
      favorites.remove(business);
    } else {
      favorites.add(business);
    }
  }

  bool isFavorite(Business business) {
    return favorites.contains(business);
  }
}

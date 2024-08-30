import 'package:business_directory/controllers/auth_controller.dart';
import 'package:business_directory/controllers/business_controller.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController searchInputController = TextEditingController();
  Rx<int> index = 0.obs;
  Rx<bool> isLoading = false.obs;
  Rx<Position?> userPosition = Rx<Position?>(null);
  late AuthController authController;
  late BusinessController businessController;

  @override
  void onInit() {
    authController = Get.find<AuthController>();

    authController.getUserData().then((res) {
      res.fold((l) {
        l.showError();
      }, (_) {});
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
    index.value = i;
  }

  void toggleIsLoading() {
    isLoading.value = !isLoading.value;
  }

  void setUserPosition(Position position) {
    userPosition.value = position;
  }

  @override
  void onClose() {
    searchInputController.dispose();
    super.onClose();
  }
}

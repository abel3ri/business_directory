import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController searchInputController = TextEditingController();
  Rx<int> index = 0.obs;
  Rx<bool> isLoading = false.obs;

  Rx<Position?> userPosition = Rx<Position?>(null);

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

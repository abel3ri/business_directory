import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController searchInputController = TextEditingController();
  Rx<int> index = 0.obs;

  void onPageChanged(int i) {
    index.value = i;
  }

  @override
  void onClose() {
    searchInputController.dispose();
    super.onClose();
  }
}

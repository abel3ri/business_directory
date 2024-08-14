import 'package:get/get.dart';

class HomePageBottomNavController extends GetxController {
  Rx<int> index = 0.obs;

  void onPageChnaged(int i) {
    index.value = i;
  }
}

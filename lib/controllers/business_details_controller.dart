import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class BusinessDetailsController extends GetxController {
  CarouselSliderController controller = CarouselSliderController();
  Rx<bool> isLoading = false.obs;
  Rx<int> activeIndex = 0.obs;
  void setCurrentIndex(int index) {
    activeIndex.value = index;
  }

  void toggleIsLoading() {
    isLoading.value = !isLoading.value;
  }
}

import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class BusinessDetailsController extends GetxController {
  CarouselSliderController controller = CarouselSliderController();

  Rx<int> activeIndex = 0.obs;

  void setCurrentIndex(int index) {
    activeIndex.value = index;
  }
}

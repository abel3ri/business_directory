import 'package:business_directory/controllers/home_controller.dart';
import 'package:business_directory/controllers/map_page_controller.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => MapPageController());
  }
}

import 'package:business_directory/controllers/map_page_controller.dart';
import 'package:get/get.dart';

class MapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MapPageController());
  }
}

import 'package:get/get.dart';

class ImageController extends GetxController {
  Rx<String?> imagePath = Rx<String?>(null);
  Rx<String?> imageName = Rx<String?>(null);

  void setImagePathAndName(String path, String name) {
    imagePath.value = path;
    imageName.value = name;
  }
}

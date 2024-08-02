import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    final darkMode = GetStorage().read("isDarkMode");
    print(darkMode);

    if (darkMode == false) {
      isDarkMode.value = darkMode;
    } else {
      isDarkMode.value = darkMode;
    }
    super.onInit();
  }
}

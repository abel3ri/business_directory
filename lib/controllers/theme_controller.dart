import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  @override
  @override
  void onInit() {
    final darkMode = GetStorage().read("isDarkMode");
    print(darkMode);

    if (darkMode is bool) {
      isDarkMode.value = darkMode;
    } else {
      // Set a default value if the stored value is not a boolean
      isDarkMode.value = false;
    }
    super.onInit();
  }
}

import 'package:business_directory/controllers/auth_controller.dart';
import 'package:business_directory/controllers/business_controller.dart';
import 'package:business_directory/controllers/category_controller.dart';
import 'package:business_directory/controllers/search_controller.dart';
import 'package:business_directory/models/app_error.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<int> index = 0.obs;
  Rx<bool> isLoading = false.obs;
  Rx<Position?> userPosition = Rx<Position?>(null);
  late AuthController authController;
  late BusinessController businessController;
  late CategoryController categoryController;

  @override
  void onInit() {
    authController = Get.find<AuthController>();
    FlutterSecureStorage().read(key: "jwtToken").then((val) {
      if (val != null) {
        authController.getUserData().then((res) {
          res.fold((l) {
            l.showError();
          }, (_) {});
        });
      }
    });
    fetchData().then((res) {
      res.fold((l) {
        l.showError();
      }, (r) {});
    });

    super.onInit();
  }

  Future<Either<AppError, void>> fetchData() async {
    try {
      categoryController = Get.put(CategoryController());
      categoryController.fetchCategories().then((res) {
        res.fold((l) {
          l.showError();
        }, (r) {});
      });

      businessController = Get.put(BusinessController());
      businessController.getBusinesses().then((res) {
        res.fold((l) {
          l.showError();
        }, (r) {});
      });
      return right(null);
    } on DioException catch (e) {
      if (e.response != null) {
        return left(AppError(body: e.response!.data['message']));
      }

      return left(AppError(body: e.message!));
    } catch (e) {
      return left(AppError(body: e.toString()));
    } finally {
      isLoading.value = false;
    }
  }

  void onPageChanged(int i) {
    if (i != 1 && Get.focusScope!.hasFocus) {
      Get.focusScope!.unfocus();
      Get.find<SearchController>().searchResults.value = [];
      Get.find<SearchController>().searchInputController.text = "";
    }
    index.value = i;
  }

  void toggleIsLoading() {
    isLoading.value = !isLoading.value;
  }

  void setUserPosition(Position position) {
    userPosition.value = position;
  }
}

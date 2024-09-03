import 'dart:async';

import 'package:business_directory/models/app_error.dart';
import 'package:business_directory/models/business.dart';
import 'package:business_directory/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';

class BusinessController extends GetxController {
  Rx<List<Business>> businesses = Rx<List<Business>>([]);
  Rx<bool> isLoading = false.obs;

  Future<Either<AppError, void>> getBusinesses() async {
    try {
      isLoading.value = true;
      final res = await dio.get("/businesses");

      businesses.value = List.from(res.data['data']).map((business) {
        return Business.fromJson(business);
      }).toList();

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
}

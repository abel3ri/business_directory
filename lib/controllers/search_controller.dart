import 'dart:async';

import 'package:business_directory/models/app_error.dart';
import 'package:business_directory/models/business.dart';
import 'package:business_directory/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  TextEditingController searchInputController = TextEditingController();
  Timer? _debounce;
  Rx<List<Business>> searchResults = Rx<List<Business>>([]);
  Rx<bool> isLoading = false.obs;

  Future<Either<AppError, void>> searchBusinesses({
    required String query,
  }) async {
    try {
      if (_debounce?.isActive ?? false) {
        _debounce?.cancel();
      }

      _debounce = Timer(Duration(milliseconds: 500), () async {
        isLoading.value = true;
        final res = await dio.get("/businesses/search?q=${query}");
        searchResults.value = List.from(res.data['data']).map((business) {
          return Business.fromJson(business);
        }).toList();
        if (query.isEmpty) {
          searchResults.value = [];
        }
        isLoading.value = false;
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

  @override
  void onClose() {
    searchInputController.dispose();
    super.onClose();
  }
}

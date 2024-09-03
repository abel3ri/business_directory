import 'package:business_directory/models/app_error.dart';
import 'package:business_directory/models/category.dart';
import 'package:business_directory/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';

class CategoryController {
  Rx<List<Category>> categories = Rx<List<Category>>([]);

  Future<Either<AppError, void>> fetchCategories({
    int numCategories = 7,
  }) async {
    try {
      final res = await dio.get("/categories", data: {
        "limit": numCategories,
      });
      categories.value = List<Category>.from(
        res.data['data']
            .map(
              (category) => Category.fromJson(category),
            )
            .toList(),
      );

      return right(null);
    } on DioException catch (e) {
      if (e.response != null) {
        return left(AppError(body: e.response!.data['message']));
      }

      return left(AppError(body: e.message!));
    } catch (e) {
      return left(AppError(body: e.toString()));
    }
  }
}

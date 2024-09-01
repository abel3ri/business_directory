import 'package:business_directory/models/app_error.dart';
import 'package:business_directory/models/user.dart';
import 'package:business_directory/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  Rx<User?> currentUser = Rx<User?>(null);
  FlutterSecureStorage secureStorage = FlutterSecureStorage();
  Rx<bool> isLoading = false.obs;

  Future<Either<AppError, void>> signupUser(
      Map<String, dynamic> userData) async {
    try {
      isLoading.value = true;
      final res = await dio.post("/auth/signup", data: userData);
      await secureStorage.write(key: "jwtToken", value: res.data['token']);
      currentUser.value = User.fromJson(res.data['user']);
      return right(null);
    } on DioException catch (e) {
      if (e.response != null) {
        return left(AppError(body: e.response!.data['message']));
      }
      if (e.toString().contains(
          "The connection errored: Connection refused This indicates an error which most likely cannot be solved by the library.")) {
        return left(AppError(body: "Connection problem"));
      }
      return left(AppError(body: e.toString()));
    } catch (e) {
      return left(AppError(body: e.toString()));
    } finally {
      isLoading.value = false;
    }
  }

  Future<Either<AppError, void>> loginUser(
      Map<String, dynamic> userData) async {
    try {
      isLoading.value = true;
      final res = await dio.post("/auth/login", data: userData);
      await secureStorage.write(key: "jwtToken", value: res.data['token']);
      currentUser.value = User.fromJson(res.data['user']);
      return right(null);
    } on DioException catch (e) {
      if (e.response != null) {
        return left(AppError(body: e.response!.data['message']));
      }
      if (e.toString().contains(
          "The connection errored: Connection refused This indicates an error which most likely cannot be solved by the library.")) {
        return left(AppError(body: "Connection problem"));
      }
      return left(AppError(body: e.toString()));
    } catch (e) {
      return left(AppError(body: e.toString()));
    } finally {
      isLoading.value = false;
    }
  }

  Future<Either<AppError, void>> logout() async {
    try {
      currentUser.value = null;
      await secureStorage.delete(
        key: "jwtToken",
      );
      return right(null);
    } on DioException catch (e) {
      if (e.response != null) {
        return left(AppError(body: e.response!.data['message']));
      }
      return left(AppError(body: e.toString()));
    } catch (e) {
      return left(AppError(body: e.toString()));
    }
  }

  Future<Either<AppError, void>> getUserData() async {
    try {
      final token = await secureStorage.read(key: "jwtToken");
      dio.options.headers = {
        "Authorization": "Bearer ${token}",
      };
      final res = await dio.get("/users/profile");
      final user = User.fromJson(res.data['data']);
      currentUser.value = user;

      return right(null);
    } on DioException catch (e) {
      if (e.response != null) {
        return left(AppError(body: e.response!.data['message']));
      }
      return left(AppError(body: e.toString()));
    } catch (e) {
      return left(AppError(body: e.toString()));
    }
  }
}

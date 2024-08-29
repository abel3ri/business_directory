import 'package:business_directory/models/app_error.dart';
import 'package:business_directory/models/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  Rx<User?> currentUser = Rx<User?>(null);
  FlutterSecureStorage secureStorage = FlutterSecureStorage();
  Rx<bool> isLoading = false.obs;
  late Dio dio;
  AuthController() {
    dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:8000/api/v1"));
  }

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
}

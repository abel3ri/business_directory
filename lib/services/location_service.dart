import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:business_directory/models/app_error.dart';

class LocationService {
  Future<Either<AppError, bool>> requestPermission() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return left(
          AppError(
            body: "Location services are disabled. Please enable Location.",
          ),
        );
      }

      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.denied) {
          return left(AppError(body: "Location permission denied."));
        }

        if (permission == LocationPermission.deniedForever) {
          throw Exception("App is denied to use location.");
        }
      }
      return right(true);
    } catch (e) {
      return left(AppError(body: e.toString()));
    }
  }

  Future<Either<AppError, Position>> getCurrentPosition() async {
    try {
      final res = await requestPermission();
      return res.fold(
        (l) {
          return left(AppError(body: l.body));
        },
        (r) async {
          try {
            final userPosition = await Geolocator.getCurrentPosition(
              locationSettings: LocationSettings(
                accuracy: LocationAccuracy.high,
              ),
            );
            return right(userPosition);
          } catch (e) {
            return left(AppError(body: e.toString()));
          }
        },
      );
    } catch (e) {
      return left(AppError(body: e.toString()));
    }
  }
}

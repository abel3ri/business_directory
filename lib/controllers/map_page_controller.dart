import 'dart:async';

import 'package:business_directory/services/location_service.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:business_directory/controllers/home_controller.dart';

class MapPageController extends GetxController {
  Rx<Position?> userPosition = Rx<Position?>(null);
  Rx<bool> isLoading = true.obs;
  late StreamSubscription<Position> locationUpdateStream;
  Rx<double> currentZoom = 12.0.obs;
  Rx<LatLng?> currentCenter = Rx<LatLng?>(null);
  LatLng businessCoords = LatLng(9.005647240117275, 38.789157440757506);
  Timer? _cameraPositionUpdateFnTimer;

  Rx<List<LatLng>?> routePoints = Rx<List<LatLng>?>(null);

  MapPageController() {
    userPosition.value = Get.find<HomeController>().userPosition.value;
    currentCenter.value = LatLng(
      userPosition.value!.latitude,
      userPosition.value!.longitude,
    );
    locationUpdateStream = Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        // distanceFilter: 3,
        accuracy: LocationAccuracy.best,
      ),
    ).listen((position) async {
      try {
        userPosition.value = position;
        currentCenter.value = LatLng(position.latitude, position.longitude);
        final res = await LocationService().getRoutePoints(
          userCoords: currentCenter.value!,
          businessCoords: businessCoords,
        );

        res.fold((l) {
          l.showError();
        }, (r) {
          routePoints.value = r;
        });
      } catch (e) {
        print(e);
      } finally {
        isLoading.value = false;
      }
    });
  }

  void toggleIsLoading() {
    isLoading.value = !isLoading.value;
  }

  void increaseCurrentZoom() {
    currentZoom.value += 1;
  }

  void decreaseCurrentZoom() {
    currentZoom.value -= 1;
  }

  void updateCenter(LatLng newCenter) {
    if (_cameraPositionUpdateFnTimer?.isActive ?? false)
      _cameraPositionUpdateFnTimer!.cancel();
    _cameraPositionUpdateFnTimer = Timer(const Duration(milliseconds: 300), () {
      print(newCenter);
      currentCenter.value = newCenter;
    });
  }

  @override
  void onClose() {
    super.onClose();
    locationUpdateStream.cancel().then((_) {
      if (kDebugMode) {
        print("location updates stopped.");
      }
    });
  }
}

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:business_directory/controllers/home_controller.dart';

class MapPageController extends GetxController {
  Rx<Position?> userPosition = Rx<Position?>(null);
  Rx<bool> isLoading = false.obs;
  late StreamSubscription<Position> locationUpdateStream;
  Rx<double> currentZoom = 12.0.obs;
  Rx<LatLng?> currentCenter = Rx<LatLng?>(null);

  MapPageController() {
    userPosition.value = Get.find<HomeController>().userPosition.value;
    currentCenter.value = LatLng(
      userPosition.value!.latitude,
      userPosition.value!.longitude,
    );
    locationUpdateStream = Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.best,
      ),
    ).listen((position) {
      userPosition.value = position;
      currentCenter.value = LatLng(position.latitude, position.longitude);
      print(position);
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

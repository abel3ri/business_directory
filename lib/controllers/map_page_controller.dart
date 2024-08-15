import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class MapPageController extends GetxController {
  Rx<Position?> userPostion = Rx<Position?>(null);
  Rx<bool> isLoading = false.obs;

  LatLng businessLatLng = LatLng(9.020494421702157, 38.75998123861017);

  Rx<double> currentZoom = 12.0.obs;
  Rx<LatLng?> currentCenter = Rx<LatLng?>(null);

  void setUserPosition(Position position) {
    userPostion.value = position;
    currentCenter.value = LatLng(position.latitude, position.longitude);
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
}

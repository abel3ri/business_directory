import 'package:business_directory/controllers/map_page_controller.dart';
import 'package:business_directory/widgets/custom_app_bar.dart';
import 'package:business_directory/widgets/map_zoom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  final mapPageController = Get.put(MapPageController());

  MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    mapPageController.businessCoords = Get.arguments['businessCoords'];
    final name = Get.arguments['name'];
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          "${name} - Direction",
          style: Get.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomRenderCondtion: mapPageController.isLoading,
      ),
      body: Center(
        child: SizedBox(
          child: RMapPage(),
        ),
      ),
    );
  }
}

class RMapPage extends StatelessWidget {
  MapController _mapController = MapController();
  final mapPageController = Get.find<MapPageController>();
  RMapPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          backgroundColor: Get.theme.scaffoldBackgroundColor,
          // maxZoom: 14,
          onPositionChanged: (camera, hasGesture) {
            mapPageController.updateCenter(camera.center);
          },
          initialZoom: mapPageController.currentZoom.value,
          initialCenter: mapPageController.currentCenter.value!,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          if (!mapPageController.isLoading.value &&
              mapPageController.routePoints.value != null)
            PolylineLayer(polylines: [
              Polyline(
                points: mapPageController.routePoints.value!,
                color: Get.theme.colorScheme.primary,
                strokeWidth: 6,
              )
            ]),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(
                  mapPageController.userPosition.value!.latitude,
                  mapPageController.userPosition.value!.longitude,
                ),
                child: Icon(
                  Icons.location_on,
                  color: Get.theme.colorScheme.primary,
                  size: 32,
                ),
              ),
              Marker(
                point: LatLng(
                  mapPageController.businessCoords.latitude,
                  mapPageController.businessCoords.longitude,
                ),
                child: Icon(
                  Icons.my_location_rounded,
                  color: Get.theme.colorScheme.primary,
                  size: 32,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: Get.theme.scaffoldBackgroundColor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MapZoomButton(
                    mapPageController: mapPageController,
                    mapController: _mapController,
                    icon: Icons.add,
                  ),
                  SizedBox(height: 4),
                  MapZoomButton(
                    mapPageController: mapPageController,
                    mapController: _mapController,
                    icon: Icons.remove,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

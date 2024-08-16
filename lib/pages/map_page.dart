// import 'package:business_directory/controllers/map_controller.dart';
import 'package:business_directory/controllers/map_page_controller.dart';
import 'package:business_directory/widgets/map_zoom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  final mapPageController = Get.find<MapPageController>();
  MapController _mapController = MapController();
  MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map Page"),
        centerTitle: true,
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(8),
            child: Obx(() {
              return mapPageController.isLoading.value
                  ? LinearProgressIndicator(
                      color: Theme.of(context).colorScheme.primary,
                    )
                  : SizedBox.shrink();
            })),
      ),
      body: Center(
        child: SizedBox(
          child: Obx(() {
            return FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialZoom: mapPageController.currentZoom.value,
                initialCenter: mapPageController.currentCenter.value!,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                if (!mapPageController.isLoading.value)
                  PolylineLayer(polylines: [
                    Polyline(
                      points: mapPageController.routePoints.value!,
                      color: Theme.of(context).colorScheme.primary,
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
                        color: Theme.of(context).colorScheme.primary,
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
                      color: Theme.of(context).scaffoldBackgroundColor,
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
            );
          }),
        ),
      ),
    );
  }
}

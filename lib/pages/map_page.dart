// import 'package:business_directory/controllers/map_controller.dart';
import 'package:business_directory/controllers/map_page_controller.dart';
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
                MarkerLayer(
                  markers: [
                    Marker(
                      point: LatLng(
                        mapPageController.userPostion.value!.latitude,
                        mapPageController.userPostion.value!.longitude,
                      ),
                      child: Icon(
                        Icons.location_on,
                        color: Theme.of(context).colorScheme.primary,
                        size: 42,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            mapPageController.increaseCurrentZoom();
                            _mapController.move(
                              mapPageController.currentCenter.value!,
                              mapPageController.currentZoom.value,
                            );
                          },
                          child: Icon(Icons.add),
                        ),
                        SizedBox(height: 4),
                        GestureDetector(
                          onTap: () {
                            mapPageController.decreaseCurrentZoom();
                            _mapController.move(
                              mapPageController.currentCenter.value!,
                              mapPageController.currentZoom.value,
                            );
                          },
                          child: Icon(Icons.remove),
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

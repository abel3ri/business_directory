import 'package:business_directory/controllers/map_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class MapZoomButton extends StatelessWidget {
  const MapZoomButton({
    super.key,
    required this.mapPageController,
    required this.mapController,
    required this.icon,
  });

  final MapPageController mapPageController;
  final MapController mapController;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        icon == Icons.add
            ? mapPageController.increaseCurrentZoom()
            : mapPageController.decreaseCurrentZoom();
        mapController.move(
          mapPageController.currentCenter.value!,
          mapPageController.currentZoom.value,
        );
      },
      child: Icon(
        icon,
        size: 32,
      ),
    );
  }
}

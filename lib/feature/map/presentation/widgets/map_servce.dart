import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/feature/map/model/service_location.dart';

class MapService {
  final MapController mapController = MapController();
  List<LatLng> routeCoordinates = [];

  // Function to move the map to a specific location
  void moveToLocation(LatLng location, double zoomLevel) {
    mapController.move(location, zoomLevel);
  }

  // Function to build the map layer
  Widget buildMapLayer(LatLng? userLocation, List<ServiceLocation> restaurants,
      LatLng? selectedRestaurantLocation) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCenter: userLocation ?? const LatLng(0, 0),
        initialZoom: 13.0,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        ),
        PolylineLayer(
          polylines: [
            Polyline(
              points: routeCoordinates,
              strokeWidth: 5.0,
              color: Colors.blue, // Route color
            ),
          ],
        ),
        MarkerLayer(
          markers: [
            if (userLocation != null)
              Marker(
                width: 40.0,
                height: 40.0,
                point: userLocation,
                child: const Icon(
                  size: 40,
                  Icons.location_on,
                //  color: Colormanger.mainColor, // User location marker color.,
                  color: Colors.red,
                ),
              ),
            ...restaurants.map(
              (restaurant) => Marker(
                width: 40.0,
                height: 40.0,
                point: restaurant.location,
                child: const Icon(
                  Icons.location_pin,
                  size: 30,
                  color: ColorsManager.blue,
                ),
              ),
            ),
            if (selectedRestaurantLocation != null)
              Marker(
                width: 40.0,
                height: 40.0,
                point: selectedRestaurantLocation,
                child: const Icon(
                  Icons.location_pin,
                  color: Colors.green,
                ),
              ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:splash_app/feature/map/model/service_location.dart';
import 'package:splash_app/feature/map/presentation/widgets/map_servce.dart';

class MapLayer extends StatelessWidget {
  final LatLng? userLocation;
  final List<ServiceLocation> restaurants;
  final LatLng? selectedRestaurantLocation;
  final MapService mapService;

  const MapLayer({
    super.key,
    required this.userLocation,
    required this.restaurants,
    required this.selectedRestaurantLocation,
    required this.mapService,
  });

  @override
  Widget build(BuildContext context) {
    return mapService.buildMapLayer(
      userLocation,
      restaurants,
      selectedRestaurantLocation,
    );
  }
}
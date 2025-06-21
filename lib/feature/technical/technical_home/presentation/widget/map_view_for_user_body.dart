

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:splash_app/core/utils/color_manager.dart';
import 'dart:convert';
import 'package:splash_app/feature/map/presentation/widgets/current_location.dart';
import 'package:splash_app/feature/my_car/presebtation/widgets/custom_my_car_app_bar.dart';

class MapViewForUserBody extends StatefulWidget {
  const MapViewForUserBody({
    super.key, 
    required this.latitude, 
    required this.longitude
  });
  
  final double latitude;
  final double longitude;
  
  @override
  State<MapViewForUserBody> createState() => _MapViewForUserBodyState();
}

class _MapViewForUserBodyState extends State<MapViewForUserBody> {
  LatLng? _tecLocation;
  bool _isLoading = true;
  List<LatLng> _routePoints = [];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      final location = await CurrentLocation().getCurrentLocation();
      if (mounted) {
        setState(() {
          _tecLocation = location;
        });
        await _getRouteDirections();
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _getRouteDirections() async {
    if (_tecLocation == null) return;

    final startLng = widget.longitude;
    final startLat = widget.latitude;
    final endLng = _tecLocation!.longitude;
    final endLat = _tecLocation!.latitude;

    final url = Uri.parse(
      'http://router.project-osrm.org/route/v1/driving/$startLng,$startLat;$endLng,$endLat?overview=full&geometries=geojson',
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final geometry = data['routes'][0]['geometry'];
        final coordinates = geometry['coordinates'] as List;
        
        setState(() {
          _routePoints = coordinates.map((coord) {
            return LatLng(coord[1], coord[0]); // Note: GeoJSON uses [lng,lat]
          }).toList();
        });
      }
    } catch (e) {
      print('Error getting route: $e');
      // Fallback to straight line if routing fails
      setState(() {
        _routePoints = [
          LatLng(widget.latitude, widget.longitude),
          _tecLocation!,
        ];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customMyCarAppBar(title: 'User Location'),
      body: _isLoading
          ?  const Center(child:  CircularProgressIndicator(
            color: ColorsManager.mainColor,
          ))
          : FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(widget.latitude, widget.longitude),
                initialZoom: 13.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                ),
                if (_tecLocation != null) ...[
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: _routePoints,
                        strokeWidth: 5.0,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        width: 40.0,
                        height: 40.0,
                        point: _tecLocation!,
                        child: const Icon(
                          Icons.person_pin_circle,
                          color: Colors.red,
                        ),
                      ),
                      Marker(
                        width: 40.0,
                        height: 40.0,
                        point: LatLng(widget.latitude, widget.longitude),
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
    );
  }
}
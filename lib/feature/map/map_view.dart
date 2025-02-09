// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

import 'package:splash_app/feature/map/model/service_location.dart';
import 'package:splash_app/feature/map/presentation/widgets/current_location.dart';
import 'package:splash_app/feature/map/presentation/widgets/fetch_nearby_service.dart';
import 'package:splash_app/feature/map/presentation/widgets/list_view.dart';
import 'package:splash_app/feature/map/presentation/widgets/looding_indicator.dart';
import 'package:splash_app/feature/map/presentation/widgets/map_layer.dart';
import 'package:splash_app/feature/map/presentation/widgets/map_servce.dart';
import 'package:splash_app/feature/map/presentation/widgets/route_and_time.dart';

class MapView extends StatefulWidget {
  const MapView({super.key, required this.nameOfServce});
  final String nameOfServce;

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  List<ServiceLocation> restaurants = [];
  bool isLoading = true;
  String errorMessage = '';
  LatLng? userLocation;
  LatLng? selectedRestaurantLocation;

  final MapService _mapService = MapService();
  final FeatchService _featchService = FeatchService();
  final CurrentLocation _locationService = CurrentLocation();
  final RouteService _routeService = RouteService();

  @override
  void initState() {
    super.initState();
     userLocation = const LatLng(30.0444, 31.2357);
    _initializeLocationAndFetchRestaurants();
  }

  Future<void> _initializeLocationAndFetchRestaurants() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      userLocation = await _locationService.getCurrentLocation();
       userLocation = const LatLng(30.0444, 31.2357);
      if (userLocation == null) {
        throw Exception('Unable to fetch user location.');
      }

      final fetchedRestaurants = await _featchService.fetchNearbyServices(
          userLocation!, widget.nameOfServce);

      // Limit results to 10 restaurants
      // fetchedRestaurants = fetchedRestaurants.take(10).toList();
      setState(() {
        restaurants = fetchedRestaurants;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _onLocationSelected(LatLng destination) async {
    setState(() {
      selectedRestaurantLocation = destination;
      _mapService.routeCoordinates = []; // Clear previous route
    });

    // Fetch route using OpenRouteService
    List<LatLng> newRoute =
        await _routeService.fetchRoute(userLocation!, destination);

    setState(() {
      _mapService.routeCoordinates = newRoute; // Update route polyline
    });

    // Move the map to show the selected location
    _mapService.moveToLocation(destination, 15.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby ${widget.nameOfServce}'),
      ),
      body: LoadingAndErrorHandler(
        isLoading: isLoading,
        errorMessage: errorMessage,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: MapLayer(
                userLocation: userLocation,
                restaurants: restaurants,
                selectedRestaurantLocation: selectedRestaurantLocation,
                mapService: _mapService,
              ),
            ),
            Expanded(
              flex: 1,
              child: restaurants.isEmpty
                  ? Center(
                      child: Text('No ${widget.nameOfServce} found nearby.'),
                    )
                  : RestaurantList(
                      restaurants: restaurants,
                      onRestaurantSelected: _onLocationSelected,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}


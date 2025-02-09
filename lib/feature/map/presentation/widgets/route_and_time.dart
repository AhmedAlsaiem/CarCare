// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class RouteService {
  static const String _apiKey = '5b3ce3597851110001cf624858461a871946480d96231063698c9bb4';
  static const String _routeBaseUrl = 'https://api.openrouteservice.org/v2/directions/driving-car';

  // Fetch travel time between two locations
  Future<int> fetchTravelTime(LatLng origin, LatLng destination) async {
    final url = '$_routeBaseUrl?api_key=$_apiKey&start=${origin.longitude},${origin.latitude}&end=${destination.longitude},${destination.latitude}';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['features'] != null && data['features'].isNotEmpty) {
          final summary = data['features'][0]['properties']['summary'];
          return summary['duration']?.round() ?? 0;
        }
      }
    } catch (e) {
      print('Error fetching travel time: $e');
    }

    return 0;
  }

  // Fetch route coordinates
  Future<List<LatLng>> fetchRoute(LatLng start, LatLng end) async {
    final url = '$_routeBaseUrl?api_key=$_apiKey&start=${start.longitude},${start.latitude}&end=${end.longitude},${end.latitude}';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<LatLng> routePoints = [];

        if (data['features'] != null && data['features'].isNotEmpty) {
          List<dynamic> coordinates = data['features'][0]['geometry']['coordinates'];

          for (var coord in coordinates) {
            routePoints.add(LatLng(coord[1], coord[0]));
          }
        }

        return routePoints;
      } else {
        throw Exception('Failed to load route: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching route: $e');
      return [];
    }
  }
}

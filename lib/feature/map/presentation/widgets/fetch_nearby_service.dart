import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:splash_app/feature/map/model/service_location.dart';
import 'package:splash_app/feature/map/presentation/widgets/fetch_address_and_name_service.dart';
import 'package:splash_app/feature/map/presentation/widgets/route_and_time.dart';

class FeatchService {
  static const String overpassUrlBase =
      'https://overpass-api.de/api/interpreter?data=';

  final RouteService _routeService = RouteService();
  // final GeocodingService _geocodingService = GeocodingService();
  final FetchAddressAndName _fetchAddressAndName = FetchAddressAndName();
  Future<List<ServiceLocation>> fetchNearbyServices(
      LatLng userLocation, String serviceName) async {
    final overpassQuery = '[out:json][timeout:25];'
        '('
        'node[amenity=$serviceName](around:10000,${userLocation.latitude},${userLocation.longitude});'
        'way[amenity=$serviceName](around:10000,${userLocation.latitude},${userLocation.longitude});'
        'relation[amenity=$serviceName](around:10000,${userLocation.latitude},${userLocation.longitude});'
         'node["shop"=$serviceName](around:10000,${userLocation.latitude},${userLocation.longitude});'
        'way["shop"=$serviceName](around:10000,${userLocation.latitude},${userLocation.longitude});'
         'relation["shop"=$serviceName](around:10000,${userLocation.latitude},${userLocation.longitude});'
        ');'
        'out center qt 15;';
    
    // if (serviceName == 'fuel') {
    //   final url =
    //       'https://overpass-api.de/api/interpreter?data=[out:json][timeout:20];(node[amenity=$serviceName](around:2000,${userLocation.latitude},${userLocation.longitude});way[amenity=$serviceName](around:2000,${userLocation.latitude},${userLocation.longitude});relation[amenity=$serviceName](around:2000,${userLocation.latitude},${userLocation.longitude}););out center qt 15;';
    // } else if (serviceName == 'car_wash') {
    //   final url =
    //       'https://overpass-api.de/api/interpreter?data=[out:json][timeout:20];(node[amenity=$serviceName](around:3000,${userLocation.latitude},${userLocation.longitude});way[amenity=$serviceName](around:3000,${userLocation.latitude},${userLocation.longitude});relation[amenity=$serviceName](around:3000,${userLocation.latitude},${userLocation.longitude}););out center qt 15;';
    // } else if (serviceName == 'parking') {
    // final url= 'https://overpass-api.de/api/interpreter?data=[out:json][timeout:20];(node[amenity=$serviceName](around:5000,${userLocation.latitude},${userLocation.longitude});way[amenity=$serviceName](around:5000,${userLocation.latitude},${userLocation.longitude});relation[amenity=$serviceName](around:5000,${userLocation.latitude},${userLocation.longitude}););out center qt 15;';

    // }else{
    // final url= 'https://overpass-api.de/api/interpreter?data=[out:json][timeout:20];(node["shop"=$serviceName](around:5000,${userLocation.latitude},${userLocation.longitude});way["shop"=$serviceName](around:5000,${userLocation.latitude},${userLocation.longitude});relation["shop"=$serviceName](around:5000,${userLocation.latitude},${userLocation.longitude}););out center qt 15;';

    // }

    final url = '$overpassUrlBase$overpassQuery';
    // final url =
    //     'https://overpass-api.de/api/interpreter?data=[out:json][timeout:20];(node[amenity=$serviceName](around:5000,${userLocation.latitude},${userLocation.longitude});way[amenity=$serviceName](around:5000,${userLocation.latitude},${userLocation.longitude});relation[amenity=$serviceName](around:5000,${userLocation.latitude},${userLocation.longitude}););out center qt 15;';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final utf8DecodedBody = utf8.decode(response.bodyBytes);
        final overpassData = json.decode(utf8DecodedBody);

        if (overpassData['elements'] == null ||
            overpassData['elements'] is! List) {
          throw Exception('No $serviceName found nearby.');
        }

        final elements = overpassData['elements'] as List;

        if (elements.isEmpty) {
          throw Exception('No $serviceName found nearby.');
        }

        List<ServiceLocation> fetchedServices = [];

        for (var element in elements) {
          final lat = element['lat'];
          final lon = element['lon'];
          final location = LatLng(lat, lon);

          final name = element['tags']['name'] ?? 'Unnamed $serviceName';
          final address = element['tags']['addr:street'] ??
              await _fetchAddressAndName.getAddress(location);

          final serviceNameFinal = name == 'Unnamed $serviceName'
              ? await _fetchAddressAndName.getName(location)
              : name;

          final travelTime =
              await _routeService.fetchTravelTime(userLocation, location);

          fetchedServices.add(
            ServiceLocation(
              name: serviceNameFinal,
              address: address,
              location: location,
              travelTime: travelTime,
            ),
          );
        }

        // Sort list based on travel time
        fetchedServices.sort((a, b) => a.travelTime.compareTo(b.travelTime));

        return fetchedServices;
      } else {
        throw Exception('Failed to load $serviceName: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
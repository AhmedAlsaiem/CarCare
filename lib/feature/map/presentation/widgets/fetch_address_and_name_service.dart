// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class FetchAddressAndName {
  static const String _nominatimBaseUrl = 'https://nominatim.openstreetmap.org/reverse?format=json';

  // Fetch address based on latitude and longitude
  Future<String> getAddress(LatLng location) async {
    final url = '$_nominatimBaseUrl&lat=${location.latitude}&lon=${location.longitude}&addressdetails=1';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['address'] != null) {
          return '${data['address']['road'] ?? ''}, ${data['address']['city'] ?? ''}, ${data['address']['country'] ?? ''}';
        }
      }
    } catch (e) {
      print('Error fetching address: $e');
    }
    return 'Unknown Address';
  }

  // Fetch place name based on coordinates
  Future<String> getName(LatLng location) async {
    final url = '$_nominatimBaseUrl&lat=${location.latitude}&lon=${location.longitude}';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['display_name'] ?? 'Unknown Address';
      }
    } catch (e) {
      print('Error fetching name: $e');
    }
    return 'Unknown Address';
  }
}

import 'package:latlong2/latlong.dart';

class ServiceLocation {
  final String name;
  final String address;
  final LatLng location;
  final int travelTime; // Travel time in seconds

  ServiceLocation({
    required this.name,
    required this.address,
    required this.location,
    required this.travelTime,
  });
}

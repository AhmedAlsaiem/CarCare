import 'package:location/location.dart';
import 'package:latlong2/latlong.dart';

class CurrentLocation {
  final Location _location = Location();

  Future<LatLng?> getCurrentLocation() async {
    bool serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    PermissionStatus permission = await _location.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await _location.requestPermission();
      if (permission != PermissionStatus.granted) {
        return null;
      }
    }

    final currentLocation = await _location.getLocation();
    return LatLng(currentLocation.latitude!, currentLocation.longitude!);
  }
}

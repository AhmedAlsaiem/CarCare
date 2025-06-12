import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:splash_app/core/functions/get_current_location.dart';

class CurrentLocation {
  Future<LatLng?> getCurrentLocation() async {
    final Position currentLocation = await getCurrentMobileLocations();
    return LatLng(currentLocation.latitude, currentLocation.longitude);
  }
}

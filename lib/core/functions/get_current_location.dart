import 'package:geolocator/geolocator.dart';

Future<Position> getCurrentMobileLocations() async {
  bool serviceEnabled;
  LocationPermission permission;

  // التحقق مما إذا كان GPS مفعلاً
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error(" GPS is not enabled. Please turn it on");
  }

  // التحقق من الأذونات
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error("Location permission denied.");
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        "Location permission is permanently denied. Please change it in settings.");
  }

  return await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
}

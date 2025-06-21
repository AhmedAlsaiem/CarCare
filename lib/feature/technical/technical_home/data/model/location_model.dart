import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/feature/technical/technical_home/domain/entity/location_entity.dart';

class LocationModel extends LocationEntity {
  const LocationModel(
      {required super.id, required super.latitude, required super.longitude});
  factory LocationModel.fromJson(Map<String, dynamic> jsonData) {
    return LocationModel(
      id: jsonData[ApiKey.userLocationId],
      latitude: jsonData[ApiKey.techLatitudeloc],
      longitude: jsonData[ApiKey.techLongitudeloc],
    );
  }
}

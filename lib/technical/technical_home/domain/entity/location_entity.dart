import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final String id ;
 final double latitude;
final double longitude;
 
  const LocationEntity({
    required this.id,
    required this.latitude,
    required this.longitude,

  });

  @override
  List<Object?> get props => [
        id,
        latitude,
        longitude,
      ];
}
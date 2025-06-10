import 'package:splash_app/technical/technical_home/domain/entity/location_entity.dart';

class LocationState {}

class IsLoadingLocationState extends LocationState {}

class SuccessLocationState extends LocationState {
  final LocationEntity locationEntity; // Store list of orders
  final String? successMessage;

  SuccessLocationState(this.locationEntity, {this.successMessage});
}

class FaliureLocationState extends LocationState {
  final String errorMessage;

  FaliureLocationState({required this.errorMessage});
}

import 'package:splash_app/feature/add_car/domain/entities/car_entity.dart';

class CarState {}

class IsLoadingCarState extends CarState {}

class SuccessCarState extends CarState {
  String? successMessage;
  SuccessCarState(this.successMessage);
}

class SuccessGetCarState extends CarState {
  List<CarEntity >carList;
  SuccessGetCarState(this.carList);
}
class FaliureCarState extends CarState {
  final String errorMessage;

  FaliureCarState({required this.errorMessage});
}

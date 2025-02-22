class CarState {}

class IsLoadingCarState extends CarState {}

class SuccessCarState extends CarState {
  String? successMessage;
  SuccessCarState(this.successMessage);
}

class FaliureCarState extends CarState {
  final String errorMessage;

  FaliureCarState({required this.errorMessage});
}

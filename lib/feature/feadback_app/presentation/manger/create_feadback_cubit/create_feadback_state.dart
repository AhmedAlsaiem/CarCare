class FeadbackState {}

class IsLoadingFeadbackState extends FeadbackState {}

class SuccessFeadbackState extends FeadbackState {
  String? successMessage;
  SuccessFeadbackState(this.successMessage);
}

class FaliureFeadbackState extends FeadbackState {
  final String errorMessage;

  FaliureFeadbackState({required this.errorMessage});
}

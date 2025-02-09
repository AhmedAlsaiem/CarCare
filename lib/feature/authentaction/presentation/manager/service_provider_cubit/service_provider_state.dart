class ServiceProviderState {}

class IsLoadingServiceProviderState extends ServiceProviderState {}

class SuccessServiceProviderState extends ServiceProviderState {
  String? successMessage;
  SuccessServiceProviderState(this.successMessage);
}

class FaliureServiceProviderState extends ServiceProviderState {
  final String errorMessage;

  FaliureServiceProviderState({required this.errorMessage});
}

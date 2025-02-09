class UserState {}

class IsLoadingUserState extends UserState {}

class SuccessUserState extends UserState {
  String? successMessage;
  SuccessUserState(this.successMessage);
}

class FaliureUserState extends UserState {
  final String errorMessage;

  FaliureUserState({required this.errorMessage});
}

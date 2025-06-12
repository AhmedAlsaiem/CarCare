class UserState {}

class IsLoadingUserState extends UserState {}

class SuccessUserState extends UserState {
  String? successMessage;
  SuccessUserState(this.successMessage);
}

class FaliureUserState extends UserState {
  final String errorMessage;
  String? errordata;
  FaliureUserState({required this.errorMessage, this.errordata});
}

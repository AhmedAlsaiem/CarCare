import 'package:splash_app/feature/user_profile/domain/entities/user_profile_entity.dart';

abstract class UserProfileState {}

class UserProfileInatialState extends UserProfileState {}

class UserProfileSucessState extends UserProfileState {
  UserProfileEntity user;
  UserProfileSucessState({required this.user});
}

class UserProfileFailedState extends UserProfileState {
  final String errorMassage;

  UserProfileFailedState({required this.errorMassage});
}

class UserProfileIsLoadingState extends UserProfileState {}

//! update current user state
class UpdateUserProfileSucessState extends UserProfileState {
  UserProfileEntity user;
  UpdateUserProfileSucessState({required this.user});
}

class UpdateUserProfileFailedState extends UserProfileState {
  final String errorMassage;

  UpdateUserProfileFailedState({required this.errorMassage});
}

class UpdateUserProfileIsLoadingState extends UserProfileState {}

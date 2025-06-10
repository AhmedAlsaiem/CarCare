import 'package:splash_app/technical/technical_setting/domain/entity/update_profile_entity.dart';

class UpdateProfileState {}

class IsLoadingUpdateProfileState extends UpdateProfileState {}

class SuccessUpdateProfileState extends UpdateProfileState {
  final UpdateProfileEntity updateProfileEntity; // Store list of orders
  final String? successMessage;

  SuccessUpdateProfileState(this.updateProfileEntity, {this.successMessage});
}

class FaliureUpdateProfileState extends UpdateProfileState {
  final String errorMessage;

  FaliureUpdateProfileState({required this.errorMessage});
}

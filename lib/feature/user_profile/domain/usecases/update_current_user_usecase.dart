import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/user_profile/domain/entities/user_profile_entity.dart';
import 'package:splash_app/feature/user_profile/domain/repo/user_profile_repo.dart';

class UpdateCurrentUserProfileUseCase {
  UserProfileRepo userProfileRepo;
  UpdateCurrentUserProfileUseCase({required this.userProfileRepo});
  Future<Either<ErrorModel, UserProfileEntity>> excute(
      {required String email,
      required String userName,
      required String phoneNumber}) {
    return userProfileRepo.updateCurrentUserData(
      email: email,
      userName: userName,
      phoneNumber: phoneNumber,
    );
  }
}

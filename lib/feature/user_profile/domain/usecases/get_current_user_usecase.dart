import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/user_profile/domain/entities/user_profile_entity.dart';
import 'package:splash_app/feature/user_profile/domain/repo/user_profile_repo.dart';

class GetCurrentUserUsecaseUserProfile {
  UserProfileRepo userProfileRepo;
  GetCurrentUserUsecaseUserProfile({required this.userProfileRepo});
  Future<Either<ErrorModel,UserProfileEntity>>excute(){
    return userProfileRepo.getCurrentUser();
  }
}

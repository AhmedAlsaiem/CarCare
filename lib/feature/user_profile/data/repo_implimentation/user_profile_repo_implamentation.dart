import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/feature/user_profile/data/remote_datasource/user_profile_remote_datasouce.dart';
import 'package:splash_app/feature/user_profile/domain/entities/user_profile_entity.dart';
import 'package:splash_app/feature/user_profile/domain/repo/user_profile_repo.dart';

class UserProfileRepoImplamentation extends UserProfileRepo {
  BaseUserProfileRemoteDatasouce baseUserProfileRemoteDatasouce;
  UserProfileRepoImplamentation({required this.baseUserProfileRemoteDatasouce});
  @override
  Future<Either<ErrorModel, UserProfileEntity>> getCurrentUser() async {
    try {
      UserProfileEntity user;
      user = await baseUserProfileRemoteDatasouce.getCurrentUser();
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, UserProfileEntity>> updateCurrentUserData(
      {required String email,
      required String userName,
      required String phoneNumber}) async {
    try {
      UserProfileEntity user;
      user = await baseUserProfileRemoteDatasouce.updateUser(
          email: email, userName: userName, phoneNumber: phoneNumber);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }
}

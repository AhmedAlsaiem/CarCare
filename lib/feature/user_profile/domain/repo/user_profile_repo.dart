import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/user_profile/domain/entities/user_profile_entity.dart';

abstract class UserProfileRepo {
 Future< Either<ErrorModel, UserProfileEntity>> getCurrentUser();
  Future<Either<ErrorModel, UserProfileEntity>> updateCurrentUserData({
    required String email,
    required String userName,
    required String phoneNumber,
  });
}

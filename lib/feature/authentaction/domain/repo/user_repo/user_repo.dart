import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/authentaction/data/model/response_model.dart';
import 'package:splash_app/feature/authentaction/domain/entity/user_entities/user_entities.dart';

abstract class UserRepo {
  Future<Either<ErrorModel, UserEntity>> signUp({
    required String phoneNumber,
    required String email,
    required String userName,
    required String password,
    required int type,
  });
  Future<Either<ErrorModel, UserEntity>> login({
    required String phoneNumber,
    required String password,
  });
  Future<Either<ErrorModel, UserEntity>> getCurrentUser();
  Future<void> changePassword({
    required String newPassword,
    required String currentPassword,
  });
  Future<void> confirmEmail({
    required String email,
    required int confirmationCode,
  });
  Future<void> getRefreskToken({
    required String token,
    required String refreshToken,
  });
  Future<void> revokeRefreshToken({
    required String token,
    required String refreshToken,
  });
  Future<Either<ErrorModel,ResponseModel>>forgetPasswordByEmail({
    required String email,
  });
   Future<Either<ErrorModel,ResponseModel>> verifyCode({
    required String email,
    required int resetcode,
  });
   Future<Either<ErrorModel, UserEntity>> resetPassword({
    required String email,
    required String newPassword,
  });
  Future<void> confirmationCode({
    required String email,
  });
  Future<Either<ErrorModel, UserEntity>> updateUser({
    required String email,
    required String userName,
    required String phoneNumber,
  });
}

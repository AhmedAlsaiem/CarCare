import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/feature/authentaction/data/datasource/user_remote_data_source.dart';
import 'package:splash_app/feature/authentaction/data/model/response_model.dart';
import 'package:splash_app/feature/authentaction/data/model/user_model.dart';
import 'package:splash_app/feature/authentaction/domain/entity/user_entities/user_entities.dart';
import 'package:splash_app/feature/authentaction/domain/repo/user_repo/user_repo.dart';

class UserRepoImplementation extends UserRepo {
  BaseUserRemoteDataSource baseUserRemoteDataSource;
  UserRepoImplementation({required this.baseUserRemoteDataSource});
  @override
  Future<void> changePassword(
      {required String newPassword, required String currentPassword}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorModel, ResponseModel>> confirmEmail(
      {required String email, required int confirmationCode}) async {
    try {
      dynamic response = await baseUserRemoteDataSource.confirmEmail(
          email: email, confirmationCode: confirmationCode);
      return right(response);
    } on ServerException catch (e) {
      return left(
        ErrorModel(
            statusCode: e.errModel.statusCode,
            errorMessage: e.errModel.errorMessage),
      );
    }
  }

  @override
  Future<Either<ErrorModel, ResponseModel>> confirmationCode(
      {required String email}) async {
    try {
      dynamic response =
          await baseUserRemoteDataSource.confirmationCode(email: email);
      return right(response);
    } on ServerException catch (e) {
      return left(
        ErrorModel(
            statusCode: e.errModel.statusCode,
            errorMessage: e.errModel.errorMessage),
      );
    }
  }

  @override
  Future<Either<ErrorModel, ResponseModel>> forgetPasswordByEmail(
      {required String email}) async {
    try {
      ResponseModel response;
      response =
          await baseUserRemoteDataSource.forgetPasswordByEmail(email: email);
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, UserEntity>> getCurrentUser() {
    throw UnimplementedError();
  }

  @override
  Future<void> getRefreskToken(
      {required String token, required String refreshToken}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorModel, UserEntity>> login(
      {required String phoneNumber, required String password}) async {
    try {
      UserModel user = await baseUserRemoteDataSource.login(
          phoneNumber: phoneNumber, password: password);
      return right(user);
    } on ServerException catch (e) {
      return left(ErrorModel(
          statusCode: e.errModel.statusCode,
          errorMessage: e.errModel.errorMessage));
    }
  }

  @override
  Future<Either<ErrorModel, UserEntity>> resetPassword(
      {required String email, required String newPassword}) async {
    try {
      UserEntity user = await baseUserRemoteDataSource.resetPassword(
          email: email, newPassword: newPassword);
      return right(user);
    } on ServerException catch (e) {
      return left(e.errModel);
    }
  }

  @override
  Future<void> revokeRefreshToken(
      {required String token, required String refreshToken}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorModel, UserEntity>> signUp(
      {required String phoneNumber,
      required String email,
      required String userName,
      required String password,
      required int type}) async {
    try {
      UserModel userModel = await baseUserRemoteDataSource.userSignUp(
          phoneNumber: phoneNumber,
          email: email,
          userName: userName,
          password: password);
      return right(userModel);
    } on ServerException catch (e) {
      return left(
        ErrorModel(
            statusCode: e.errModel.statusCode,
            errorMessage: e.errModel.errorMessage),
      );
    }
  }

  @override
  Future<Either<ErrorModel, UserEntity>> updateUser(
      {required String email,
      required String userName,
      required String phoneNumber}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorModel, ResponseModel>> verifyCode(
      {required String email, required int resetcode}) async {
    try {
      dynamic response = await baseUserRemoteDataSource.verifyCode(
          email: email, resetcode: resetcode);
      return right(response);
    } on ServerException catch (e) {
      return left(
        ErrorModel(
            statusCode: e.errModel.statusCode,
            errorMessage: e.errModel.errorMessage),
      );
    }
  }
}

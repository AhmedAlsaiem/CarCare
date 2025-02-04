import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/feature/authentaction/data/datasource/user_remote_data_source.dart';
import 'package:splash_app/feature/authentaction/data/model/response_model.dart';
import 'package:splash_app/feature/authentaction/data/model/user_model.dart';
import 'package:splash_app/feature/authentaction/domain/entity/user_entities/user.dart';
import 'package:splash_app/feature/authentaction/domain/repo/user_repo/user_repo.dart';

class UserRepoImplementation extends UserRepo {
  BaseUserRemoteDataSource baseUserRemoteDataSource;
  UserRepoImplementation({required this.baseUserRemoteDataSource});
  @override
  Future<void> changePassword(
      {required String newPassword, required String currentPassword}) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<void> confirmEmail(
      {required String email, required int confirmationCode}) {
    // TODO: implement confirmEmail
    throw UnimplementedError();
  }

  @override
  Future<void> confirmationCode({required String email}) {
    // TODO: implement confirmationCode
    throw UnimplementedError();
  }

  @override
  Future<void> forgetPassword({required String email}) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorModel, UserEntity>> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<void> getRefreskToken(
      {required String token, required String refreshToken}) {
    // TODO: implement getRefreskToken
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
  Future<void> resetPassword(
      {required String email, required String newPassword}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<void> revokeRefreshToken(
      {required String token, required String refreshToken}) {
    // TODO: implement revokeRefreshToken
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
      dynamic userModel = await baseUserRemoteDataSource.userSignUp(
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
    // TODO: implement updateUser
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


import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/feature/authentaction/data/model/user_model.dart';

abstract class BaseUserRemoteDataSource {
  Future<UserModel> userSignUp({
    required String phoneNumber,
    required String email,
    required String userName,
    required String password,
  
  });
  Future<UserModel> login({
    required String phoneNumber,
    required String password,
  });
  Future<UserModel> getCurrentUser();
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
  Future<void> forgetPassword({
    required String email,
  });
  Future<void> verifyCode({
    required String email,
    required int resetcode,
  });
  Future<void> resetPassword({
    required String email,
    required String newPassword,
  });
  Future<void> confirmationCode({
    required String email,
  });
  Future<UserModel> updateUser({
    required String email,
    required String userName,
    required String phoneNumber,
  });
}

class UserRemoteDataSource extends BaseUserRemoteDataSource {
  ApiConsumer api;
  UserRemoteDataSource(this.api);
  @override
  Future<UserModel> userSignUp(
      {required String phoneNumber,
      required String email,
      required String userName,
      required String password,
      }) async {
    UserModel user;
    try {
      dynamic response = await api.post(EndPoint.registerUser, data: {
        ApiKey.email: email,
        ApiKey.password: password,
        ApiKey.fullName: userName,
        ApiKey.phoneNumber: phoneNumber,
        ApiKey.type: 1,
      });
      user = UserModel.fromJson(response);
      return user;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<void> changePassword(
      {required String newPassword, required String currentPassword}) {
    throw UnimplementedError();
  }

  @override
  Future<void> confirmEmail(
      {required String email, required int confirmationCode}) {
    throw UnimplementedError();
  }

  @override
  Future<void> confirmationCode({required String email}) {
    throw UnimplementedError();
  }

  @override
  Future<void> forgetPassword({required String email}) {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getCurrentUser() {
    throw UnimplementedError();
  }

  @override
  Future<void> getRefreskToken(
      {required String token, required String refreshToken}) {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> login(
      {required String phoneNumber, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<void> resetPassword(
      {required String email, required String newPassword}) {
    throw UnimplementedError();
  }

  @override
  Future<void> revokeRefreshToken(
      {required String token, required String refreshToken}) {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> updateUser(
      {required String email,
      required String userName,
      required String phoneNumber}) {
    throw UnimplementedError();
  }

  @override
  Future<void> verifyCode({required String email, required int resetcode}) {
    throw UnimplementedError();
  }
}

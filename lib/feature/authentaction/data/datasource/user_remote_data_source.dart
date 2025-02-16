import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/core/functions/save_user_data.dart';
import 'package:splash_app/core/helper/cache_helper.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/authentaction/data/model/response_model.dart';
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
  Future<ResponseModel> confirmEmail({
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
  Future<ResponseModel> forgetPasswordByEmail({
    required String email,
  });
  Future<ResponseModel> verifyCode({
    required String email,
    required int resetcode,
  });
  Future<UserModel> resetPassword({
    required String email,
    required String newPassword,
  });
  Future<ResponseModel> confirmationCode({
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
  Future<UserModel> userSignUp({
    required String phoneNumber,
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
      saveUserData(acount: user);
      return user;
    } on ServerException catch (e) {
      throw ServerException(
          errModel: ErrorModel(
              statusCode: e.errModel.statusCode,
              errorMessage: e.errModel.errorMessage));
    }
  }

  @override
  Future<UserModel> login(
      {required String phoneNumber, required String password}) async {
    UserModel user;
    try {
      dynamic response = await api.post(EndPoint.login, data: {
        ApiKey.password: password,
        ApiKey.phoneNumber: phoneNumber,
      });
      user = UserModel.fromJson(response);
      saveUserData(acount: user);
      return user;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<ResponseModel> confirmEmail(
      {required String email, required int confirmationCode}) async {
    ResponseModel apiResponse;
    try {
      dynamic response = await api.post(EndPoint.confirmEmail, data: {
        ApiKey.email: email,
        ApiKey.confimationCode: confirmationCode,
      });
      apiResponse = ResponseModel.fromJson(response);
      return apiResponse;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<ResponseModel> confirmationCode({required String email}) async {
    ResponseModel apiResponse;
    try {
      dynamic response = await api.post(EndPoint.confirmationCodeEmail, data: {
        ApiKey.email: email,
      });
      apiResponse = ResponseModel.fromJson(response);
      CacheHelper().saveData(key: StringsManager.verifyYourAcount, value: true);
//data
      return apiResponse;
    } on ServerException catch (e) {
      throw ServerException(
        errModel: ErrorModel(
            statusCode: e.errModel.statusCode,
            errorMessage: e.errModel.errorMessage),
      );
    }
  }

  @override
  Future<ResponseModel> forgetPasswordByEmail({required String email}) async {
    ResponseModel apiResponse;
    try {
      dynamic response = await api.post(EndPoint.forgetPasswordEmail, data: {
        ApiKey.email: email,
      });
      apiResponse = ResponseModel.fromJson(response);
      return apiResponse;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<ResponseModel> verifyCode(
      {required String email, required int resetcode}) async {
    ResponseModel apiResponse;
    try {
      dynamic response = await api.post(EndPoint.verfiyCodeEmail, data: {
        ApiKey.email: email,
        ApiKey.resetCode: resetcode,
      });
      apiResponse = ResponseModel.fromJson(response);
      return apiResponse;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<UserModel> updateUser(
      {required String email,
      required String userName,
      required String phoneNumber}) async {
    UserModel user;
    try {
      dynamic response = await api.put(EndPoint.updateUser, data: {
        ApiKey.email: email,
        ApiKey.fullName: userName,
        ApiKey.phoneNumber: phoneNumber,
      });
      user = UserModel.fromJson(response);
      return user;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

//ToDo this don't complate
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
  Future<void> revokeRefreshToken(
      {required String token, required String refreshToken}) {
    throw UnimplementedError();
  }

  @override
  Future<void> changePassword(
      {required String newPassword, required String currentPassword}) {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> resetPassword(
      {required String email, required String newPassword}) async {
    UserModel user;
    try {
      dynamic response = await api.put(EndPoint.registerUser, data: {
        ApiKey.email: email,
        ApiKey.newPassword: newPassword,
      });
      user = UserModel.fromJson(response);
      print('user email ${user.email}');
      print('user id ${user.id}');
      print('user token ${user.token}');
      print('user type ${user.type}');

      saveUserData(acount: user);
      return user;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }
}

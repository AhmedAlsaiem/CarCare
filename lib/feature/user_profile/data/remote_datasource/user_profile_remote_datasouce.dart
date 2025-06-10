import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/feature/user_profile/data/model/user_profile_model.dart';

abstract class BaseUserProfileRemoteDatasouce {
  Future<UserProfileModel> updateUser(
      {required String email,
      required String userName,
      required String phoneNumber});
  Future<UserProfileModel> getCurrentUser();
}

class UserProfileRemoteDatasouce extends BaseUserProfileRemoteDatasouce {
  ApiConsumer api;

  UserProfileRemoteDatasouce({required this.api});

  @override
  Future<UserProfileModel> updateUser(
      {required String email,
      required String userName,
      required String phoneNumber}) async {
    UserProfileModel user;
    try {
      dynamic response = await api.put(EndPoint.updateUser, data: {
        ApiKey.email: email,
        ApiKey.fullName: userName,
        ApiKey.phoneNumber: phoneNumber,
      });
      user = UserProfileModel.fromJson(response);
      return user;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<UserProfileModel> getCurrentUser() async {
    UserProfileModel user;
    try {
      dynamic response = await api.get(EndPoint.getCurrentUser);
      user = UserProfileModel.fromJson(response);
      return user;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }
}

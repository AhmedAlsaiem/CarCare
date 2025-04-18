import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/technical/technical_setting/data/moedel/update_profile_model.dart';

abstract class BaseUpdateProfileRemoteDataSource {
  Future<UpdateProfileModel> updateProfile({
    required String name,
    required String email,
    required String phoneNumber,
    required String id,
  });
}

class UpdateProfileDateSourse extends BaseUpdateProfileRemoteDataSource {
  ApiConsumer api;
  UpdateProfileDateSourse(this.api);

  @override
  Future<UpdateProfileModel> updateProfile({
    required String name,
    required String phoneNumber,
     required String id,
    required String email,
  }) async {
    UpdateProfileModel updateProfileModel;
    try {
      dynamic response = await api.put(EndPoint.udateProfile, data: {
        ApiKey.fullNameUpdate: name,
        ApiKey.phoneNumberUpdate: phoneNumber,
          ApiKey.idUpdate: id,
        ApiKey.emailUpdate: email
      });
      updateProfileModel = UpdateProfileModel.fromjson(response);
      return updateProfileModel;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }
}

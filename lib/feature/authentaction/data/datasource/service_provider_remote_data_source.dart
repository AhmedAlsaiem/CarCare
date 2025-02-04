import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/core/functions/save_user_data.dart';
import 'package:splash_app/feature/authentaction/data/model/service_provider_model.dart';

import '../../../../core/api/end_point.dart';

abstract class BaseServiceProviderRemoteDataSource {
  Future<ServiceProviderModel> serviceProviderSignUP({
    required String phoneNumber,
    required String email,
    required String userName,
    required String nationalId,
    required String password,
  });
}

class ServiceProviderRemoteDataSource
    extends BaseServiceProviderRemoteDataSource {
  ApiConsumer api;

  ServiceProviderRemoteDataSource({required this.api});

  @override
  Future<ServiceProviderModel> serviceProviderSignUP({
    required String phoneNumber,
    required String email,
    required String userName,
    required String nationalId,
    required String password,
  }) async {
    ServiceProviderModel serviceProvider;
    try {
      dynamic response = await api.post(EndPoint.registerTechnical, data: {
        ApiKey.email: email,
        ApiKey.password: password,
        ApiKey.fullName: userName,
        ApiKey.phoneNumber: phoneNumber,
        ApiKey.nationalId: nationalId,
        ApiKey.type: 0,
      });
      serviceProvider = ServiceProviderModel.fromJson(response);
      saveServiceProviderData(acount: serviceProvider);
      return serviceProvider;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }
}

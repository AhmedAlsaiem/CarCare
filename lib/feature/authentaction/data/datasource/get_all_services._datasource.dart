import 'package:dio/dio.dart';
import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/feature/authentaction/data/model/service_model.dart';

abstract class BaseGetAllSErvicesRemoteDataSource {
  Future<List<ServiceModel>> getAllServices();
}

class GetAllServicesRemoteDataSource
    extends BaseGetAllSErvicesRemoteDataSource {
  ApiConsumer api;
  GetAllServicesRemoteDataSource({required this.api});

  @override
  Future<List<ServiceModel>> getAllServices() async {
    try {
      dynamic response = await api.get(EndPoint.getAllServices);
      List<ServiceModel> services = (response as List)
          .map((item) => ServiceModel.fomJson(jsonData: item))
          .toList();

      return services;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }
}

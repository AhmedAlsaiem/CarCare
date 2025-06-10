import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/technical/technical_home/data/model/location_model.dart';

abstract class BaseLocationRemoteDataSource {
  Future<LocationModel> setLocation({required String id , required double latitude , required double longitude});
}
class LocationRemoteDataSource extends BaseLocationRemoteDataSource {
   final ApiConsumer api;
  LocationRemoteDataSource({ required this.api});
  @override
  Future<LocationModel> setLocation({required String id , required double latitude , required double longitude}) async {
    LocationModel locationModel;
    try {
      dynamic response =
          await api.put(EndPoint.setLocation , data: {
        ApiKey.userLocationId: id,
        ApiKey.techLatitudeloc: latitude,
        ApiKey.techLongitudeloc: longitude,
      });
      locationModel = LocationModel.fromJson(response);
      return locationModel;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }
}
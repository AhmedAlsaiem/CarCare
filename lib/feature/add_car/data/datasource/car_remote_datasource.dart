
import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/feature/add_car/data/model/car_model.dart';

abstract class CarBaseRemoteDataSource {
  Future<CarModel> createCar({
    required String model,
    required String color,
    required int year,
    required String vinNumber,
    required String plateNumber,
  });
  Future<void> deleteCare({required int id});
  Future<CarModel> getCarById({required int id});
  Future<List<CarModel>> getCarforSpecificUser();
 
  
}

class CarRemoteDatasource extends CarBaseRemoteDataSource {
  ApiConsumer api;
  CarRemoteDatasource({required this.api});
  @override
  Future<CarModel> createCar(
      {required String model,
      required String color,
      required int year,
      required String vinNumber,
      required String plateNumber}) async {
    try {
      dynamic response = await api.post(EndPoint.createCar, data: {
        ApiKey.model: model,
        ApiKey.color: color,
        ApiKey.year: year,
        ApiKey.vinNumber: vinNumber,
        ApiKey.plateNumber: plateNumber,
      });
      return CarModel.fromJson(jsonData: response);
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<void> deleteCare({required int id}) async {
    try {
      await api.delete(EndPoint.deleteCar + id.toString());
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<CarModel> getCarById({required int id}) async {
    try {
      dynamic response = await api.get(EndPoint.getCarById + id.toString());
      return CarModel.fromJson(jsonData: response);
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<List<CarModel>> getCarforSpecificUser() async {
    try {
      dynamic response = await api.get(EndPoint.getAllCarsForSpecificUser);
      List<CarModel> cars = (response[ApiKey.data] as List)
          .map((item) => CarModel.fromJson(jsonData: item))
          .toList();

      return cars;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }
  
}

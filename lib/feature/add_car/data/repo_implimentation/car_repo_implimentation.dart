import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/feature/add_car/data/datasource/car_remote_datasource.dart';
import 'package:splash_app/feature/add_car/domain/entities/car_entity.dart';
import 'package:splash_app/feature/add_car/domain/repo/car_repo.dart';

class CarRepoImplimentation extends CarRepo {
  final CarBaseRemoteDataSource carBaseRemoteDataSource;
  CarRepoImplimentation({required this.carBaseRemoteDataSource});
  @override
  Future<Either<ErrorModel, CarEntity>> createCar(
      {required String model,
      required String color,
      required int year,
      required String vinNumber,
      required String plateNumber}) async {
    CarEntity car;
    try {
      car = await carBaseRemoteDataSource.createCar(
        model: model,
        color: color,
        year: year,
        vinNumber: vinNumber,
        plateNumber: plateNumber,
      );
      return Right(car);
    } on ServerException catch (e) {
      return left(ErrorModel(
          statusCode: e.errModel.statusCode,
          errorMessage: e.errModel.errorMessage));
    }
  }

  @override
  Future<Either<ErrorModel, void>> deleteCare({required int id}) async {
    try {
      await carBaseRemoteDataSource.deleteCare(id: id);
      return right(null);
    } on ServerException catch (e) {
      return left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, CarEntity>> getCarById({required int id}) async {
    CarEntity car;
    try {
      car = await carBaseRemoteDataSource.getCarById(id: id);
      return right(car);
    } on ServerException catch (e) {
      return left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, List<CarEntity>>> getCarforSpecificUser() async {
    List<CarEntity> carList;
    try {
      carList = await carBaseRemoteDataSource.getCarforSpecificUser();
      return right(carList);
    } on ServerException catch (e) {
      return left(e.errModel);
    }
  }
 
}

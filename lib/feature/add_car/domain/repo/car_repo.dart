import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/add_car/domain/entities/car_entity.dart';

abstract class CarRepo {
  Future<Either<ErrorModel, CarEntity>> createCar({
    required String model,
    required String color,
    required int year,
    required String vinNumber,
    required String plateNumber,
  });
  Future<Either<ErrorModel, void>> deleteCare({required int id});
  Future<Either<ErrorModel, CarEntity>> getCarById({required int id});
  Future<Either<ErrorModel, List<CarEntity>>> getCarforSpecificUser();


}

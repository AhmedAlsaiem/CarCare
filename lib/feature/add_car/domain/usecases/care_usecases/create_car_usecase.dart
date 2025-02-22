import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/add_car/domain/entities/car_entity.dart';
import 'package:splash_app/feature/add_car/domain/repo/car_repo.dart';

class CreateCarUsecase {
  CarRepo repo;
  CreateCarUsecase({required this.repo});
  Future<Either<ErrorModel, CarEntity>> execute({
    required String model,
    required String color,
    required int year,
    required String vinNumber,
    required String plateNumber,
  }) {
    return repo.createCar(
        model: model,
        color: color,
        year: year,
        vinNumber: vinNumber,
        plateNumber: plateNumber);
  }
}

import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/add_car/domain/entities/car_entity.dart';
import 'package:splash_app/feature/add_car/domain/repo/car_repo.dart';

class GetCarByIdUsecase {
  CarRepo car;
  GetCarByIdUsecase({required this.car});
  Future<Either<ErrorModel, CarEntity>> getCarById({required int id}) {
    return car.getCarById(id: id);
  }
}

import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/add_car/domain/entities/car_entity.dart';
import 'package:splash_app/feature/add_car/domain/repo/car_repo.dart';

class GetCarForSpecificUserUsecase {
  CarRepo car;
  GetCarForSpecificUserUsecase({required this.car});

  Future<Either<ErrorModel, List<CarEntity>>> getCarforSpecificUser() {
    return car.getCarforSpecificUser();
  }
}

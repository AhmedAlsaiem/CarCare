import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/add_car/domain/entities/car_entity.dart';
import 'package:splash_app/feature/add_car/domain/repo/car_repo.dart';

class GetCarForSpecificUserUsecase {
  CarRepo repo;
  GetCarForSpecificUserUsecase({required this.repo});

  Future<Either<ErrorModel, List<CarEntity>>> excute() {
    return repo.getCarforSpecificUser();
  }
}

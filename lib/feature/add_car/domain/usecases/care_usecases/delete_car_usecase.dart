import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/add_car/domain/repo/car_repo.dart';

class DeleteCarUsecase {
  CarRepo car;
  DeleteCarUsecase({required this.car});
  Future<Either<ErrorModel, void>> excute({required int id}) {
    return car.deleteCare(id: id);
  }
}

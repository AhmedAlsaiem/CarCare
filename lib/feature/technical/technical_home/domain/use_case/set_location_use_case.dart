import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/technical/technical_home/domain/entity/location_entity.dart';
import 'package:splash_app/feature/technical/technical_home/domain/repo/location_repo.dart';

class SetLocationUseCase {
  LocationRepo locationRepo;
  SetLocationUseCase(this.locationRepo);
  Future<Either<ErrorModel,LocationEntity>> excute({required String id, required double latitude, required double longitude}) async {
    return await locationRepo.setLocation(id: id, latitude: latitude, longitude: longitude);
  }
}

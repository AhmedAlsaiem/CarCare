import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/technical/technical_setting/domain/entity/profile_tecnical_entity.dart';

abstract class TecnicalProfileRepo {
  Future<Either<ErrorModel,ProfileTecnicalEntity>> getTecnicalProfile();
}

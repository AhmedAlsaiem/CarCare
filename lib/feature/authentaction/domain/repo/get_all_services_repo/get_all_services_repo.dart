import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/authentaction/domain/entity/service_entities/service_entitiy.dart';

abstract class GetAllServicesRepo {
  Future<Either<ErrorModel,List<  ServiceEntitiy >>>getAllSErvices();
}
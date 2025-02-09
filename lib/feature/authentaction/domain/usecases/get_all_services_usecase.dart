import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/authentaction/domain/repo/get_all_services_repo/get_all_services_repo.dart';

import '../entity/service_entities/service_entitiy.dart';

class GetAllServicesUsecase {
  final GetAllServicesRepo repo;
  GetAllServicesUsecase({required this.repo});
  Future<Either<ErrorModel, List<  ServiceEntitiy >>> excute() {
    return repo.getAllSErvices();
  }
}

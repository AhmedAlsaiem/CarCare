import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/paid_services/domain/enties/service_request_entity.dart' show ServiceRequestEntity;
import 'package:splash_app/feature/paid_services/domain/repo/service_request_automatic_repo.dart';

class BatteriesAutomaticRequestUsecase {
  ServiceRequestAutomaticRepo repo;
  BatteriesAutomaticRequestUsecase({required this.repo});
    Future<Either<ErrorModel, List<ServiceRequestEntity>>>
excute({
    required int id,
  }) {
    return repo.getAllOrderDetailsForSpecificUser();
  }
}

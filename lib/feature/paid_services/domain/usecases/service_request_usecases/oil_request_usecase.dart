import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/paid_services/domain/enties/service_request_entity.dart';
import 'package:splash_app/feature/paid_services/domain/repo/service_request_manual_repo.dart';

class OilRequestUsecase {
  ServiceRequestManualRepo repo;
  OilRequestUsecase({required this.repo});
  Future<Either<ErrorModel, ServiceRequestEntity>> excute({
    required int serviceTypeId,
    required String techId,
    required String typeOfOil,
    required double userLatitude,
    required double userLongitude,
    required double servicePrice,
  }) {
    return repo.createRequestForOil(
      serviceTypeId: serviceTypeId,
      techId: techId,
      typeOfOil: typeOfOil,
      userLatitude: userLatitude,
      userLongitude: userLongitude,
      servicePrice: servicePrice,
    );
  }
}

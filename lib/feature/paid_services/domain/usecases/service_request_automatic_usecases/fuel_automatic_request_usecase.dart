import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/paid_services/domain/enties/service_request_entity.dart';
import 'package:splash_app/feature/paid_services/domain/repo/service_request_automatic_repo.dart';

class FuelAutomaticRequestUsecase {
  ServiceRequestAutomaticRepo repo;
  FuelAutomaticRequestUsecase({required this.repo});
  Future<Either<ErrorModel, ServiceRequestEntity>> excute({
    required int serviceTypeId,
    required String techId,
    required String typeOfFuel,
    required double userLatitude,
    required double userLongitude,
    required double servicePrice,
    required int serviceQuantity,
  }) {
    return repo.createRequestAutomaticForFuel(
      serviceTypeId: serviceTypeId,
      typeOfFuel: typeOfFuel,
      userLatitude: userLatitude,
      userLongitude: userLongitude,
      servicePrice: servicePrice,
      serviceQuantity: serviceQuantity,
    );
  }
}

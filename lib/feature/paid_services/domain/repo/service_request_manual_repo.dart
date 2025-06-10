import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/paid_services/domain/enties/service_request_entity.dart';

abstract class ServiceRequestManualRepo {
  Future<Either<ErrorModel, ServiceRequestEntity>> createRequestForWinch({
    required int serviceTypeId,
    required String techId,
    required String typeOfWinch,
    required double userLatitude,
    required double userLongitude,
    required double servicePrice,
  });
  Future<Either<ErrorModel, ServiceRequestEntity>> createRequestForOil({
    required int serviceTypeId,
    required String techId,
    required String typeOfOil,
    required double userLatitude,
    required double userLongitude,
    required double servicePrice,
  });
  Future<Either<ErrorModel, ServiceRequestEntity>> createRequestForTire({
    required int serviceTypeId,
    required String techId,
    required String tireSize,
    required double userLatitude,
    required int serviceQuantity,
    required double userLongitude,
    required double servicePrice,
  });
  Future<Either<ErrorModel, ServiceRequestEntity>> createRequestForBatteries({
    required int serviceTypeId,
    required String techId,
    required String typeOfBattery,
    required double userLatitude,
    required double userLongitude,
    required double servicePrice,
    required int serviceQuantity,
  });
  Future<Either<ErrorModel, ServiceRequestEntity>> createRequestForFuel({
    required int serviceTypeId,
    required String techId,
    required String typeOfFuel,
    required double userLatitude,
    required double userLongitude,
    required double servicePrice,
    required int serviceQuantity,
  });
  Future<Either<ErrorModel, ServiceRequestEntity>> updateTechincal({
    required int serviceTypeId,
    required String techId,
    required String orderId,
  });
}

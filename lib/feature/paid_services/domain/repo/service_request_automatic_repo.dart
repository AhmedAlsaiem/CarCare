import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/paid_services/domain/enties/service_request_entity.dart';

abstract class ServiceRequestAutomaticRepo {
  Future<Either<ErrorModel, ServiceRequestEntity>>
      createRequestAutoMaticForWinch({
    required int serviceTypeId,
    required String typeOfWinch,
    required double userLatitude,
    required double userLongitude,
    required double servicePrice,
  });
  Future<Either<ErrorModel, ServiceRequestEntity>>
      createRequestAutomaticForOil({
    required int serviceTypeId,
    required String typeOfOil,
    required double userLatitude,
    required double userLongitude,
    required double servicePrice,
  });
  Future<Either<ErrorModel, ServiceRequestEntity>>
      createRequestAutomaticForTire({
    required int serviceTypeId,
    required String tireSize,
    required double userLatitude,
    required int serviceQuantity,
    required double userLongitude,
    required double servicePrice,
  });
  Future<Either<ErrorModel, ServiceRequestEntity>>
      createRequestAutomaticForBatteries({
    required int serviceTypeId,
    required String typeOfBattery,
    required double userLatitude,
    required double userLongitude,
    required double servicePrice,
    required int serviceQuantity,
  });
  Future<Either<ErrorModel, ServiceRequestEntity>>
      createRequestAutomaticForFuel({
    required int serviceTypeId,
    required String typeOfFuel,
    required double userLatitude,
    required double userLongitude,
    required double servicePrice,
    required int serviceQuantity,
  });
  /////////////////////////
  Future<Either<ErrorModel, ServiceRequestEntity>> getOrderDetails({
    required int id,
  });
  Future<Either<ErrorModel, List<ServiceRequestEntity>>>
      getAllOrderDetailsForSpecificUser({required String index});
  Future<Either<ErrorModel, String>> deleteOrder({required int id});
  Future<Either<ErrorModel, String>> getOrderStatus({required int id});
}
// 5 for order automatic 
// get request
// get all request for user
// delete request
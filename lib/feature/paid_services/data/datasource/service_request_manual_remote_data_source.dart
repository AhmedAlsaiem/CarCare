import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/feature/paid_services/data/model/service_request_model.dart';

abstract class BaseServiceRequestManuallyRemoteDataSource {
  Future<ServiceRequestModel> createRequestForWinch({
    required int serviceTypeId,
    required String techId,
    required String typeOfWinch,
    required double userLatitude,
    required double userLongitude,
    required double servicePrice,
  });
  Future<ServiceRequestModel> createRequestForOil({
    required int serviceTypeId,
    required String techId,
    required String typeOfOil,
    required double userLatitude,
    required double userLongitude,
    required double servicePrice,
  });
  Future<ServiceRequestModel> createRequestForTire({
    required int serviceTypeId,
    required String techId,
    required String tireSize,
    required double userLatitude,
    required int serviceQuantity,
    required double userLongitude,
    required double servicePrice,
  });
  Future<ServiceRequestModel> createRequestForBatteries({
    required int serviceTypeId,
    required String techId,
    required String typeOfBattery,
    required double userLatitude,
    required double userLongitude,
    required double servicePrice,
    required int serviceQuantity,
  });
  Future<ServiceRequestModel> createRequestForFuel({
    required int serviceTypeId,
    required String techId,
    required String typeOfFuel,
    required double userLatitude,
    required double userLongitude,
    required double servicePrice,
    required int serviceQuantity,
  });
  Future<ServiceRequestModel> updateTechincal({
    required int serviceTypeId,
    required String techId,
    required String orderId,
  });
}

class ServiceRequestManualRemoteDataSource
    extends BaseServiceRequestManuallyRemoteDataSource {
  ApiConsumer api;
  ServiceRequestManualRemoteDataSource({required this.api});

  @override
  Future<ServiceRequestModel> createRequestForBatteries(
      {required int serviceTypeId,
      required String techId,
      required String typeOfBattery,
      required double userLatitude,
      required double userLongitude,
      required double servicePrice,
      required int serviceQuantity}) async {
    try {
      dynamic response = await api.post(EndPoint.createRequestManually, data: {
        ApiKey.serviceTypeId: serviceTypeId,
        ApiKey.bettaryType: typeOfBattery,
        ApiKey.userLatitude: userLatitude,
        ApiKey.techId: techId,
        ApiKey.userLongitude: userLongitude,
        ApiKey.servicePrice: servicePrice,
        ApiKey.serviceQuantity: serviceQuantity,
      });
      return ServiceRequestModel.formJson(response);
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<ServiceRequestModel> createRequestForFuel(
      {required int serviceTypeId,
      required String techId,
      required String typeOfFuel,
      required double userLatitude,
      required double userLongitude,
      required double servicePrice,
      required int serviceQuantity}) async {
    try {
      dynamic response = await api.post(EndPoint.createRequestManually, data: {
        ApiKey.serviceTypeId: serviceTypeId,
        ApiKey.typeOfFuel: typeOfFuel,
        ApiKey.userLatitude: userLatitude,
        ApiKey.techId: techId,
        ApiKey.userLongitude: userLongitude,
        ApiKey.servicePrice: servicePrice,
        ApiKey.serviceQuantity: serviceQuantity,
      });
      return ServiceRequestModel.formJson(response);
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<ServiceRequestModel> createRequestForOil(
      {required int serviceTypeId,
      required String techId,
      required String typeOfOil,
      required double userLatitude,
      required double userLongitude,
      required double servicePrice}) async {
    try {
      dynamic response = await api.post(EndPoint.createRequestManually, data: {
        ApiKey.serviceTypeId: serviceTypeId,
        ApiKey.techId: techId,
        ApiKey.typeOfOil: typeOfOil,
        ApiKey.userLatitude: userLatitude,
        ApiKey.userLongitude: userLongitude,
        ApiKey.servicePrice: servicePrice,
      });
      return ServiceRequestModel.formJson(response);
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<ServiceRequestModel> createRequestForTire(
      {required int serviceTypeId,
      required String techId,
      required String tireSize,
      required double userLatitude,
      required int serviceQuantity,
      required double userLongitude,
      required double servicePrice}) async {
    try {
      dynamic response = await api.post(EndPoint.createRequestManually, data: {
        ApiKey.serviceTypeId: serviceTypeId,
        ApiKey.tireSize: tireSize,
        ApiKey.techId: techId,
        ApiKey.userLatitude: userLatitude,
        ApiKey.userLongitude: userLongitude,
        ApiKey.servicePrice: servicePrice,
        ApiKey.serviceQuantity: serviceQuantity,
      });
      return ServiceRequestModel.formJson(response);
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<ServiceRequestModel> createRequestForWinch(
      {required int serviceTypeId,
      required String techId,
      required String typeOfWinch,
      required double userLatitude,
      required double userLongitude,
      required double servicePrice}) async {
    try {
      dynamic response = await api.post(EndPoint.createRequestManually, data: {
        ApiKey.serviceTypeId: serviceTypeId,
        ApiKey.typeOfWinch: typeOfWinch,
        ApiKey.techId: techId,
        ApiKey.userLatitude: userLatitude,
        ApiKey.userLongitude: userLongitude,
        ApiKey.servicePrice: servicePrice,
      });
      return ServiceRequestModel.formJson(response);
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<ServiceRequestModel> updateTechincal(
      {required int serviceTypeId,
      required String techId,
      required String orderId}) async {
    try {
      dynamic response = await api.put(
          "${EndPoint.updateTechinicalInRequest}RequestId=$orderId&ServiceId=$serviceTypeId&TechnicalId=$techId");
      return ServiceRequestModel.formJson(response);
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }
}
// https://carcareapp.runasp.net/api/ServiceRequest/CreateRequestManually/RequestId=350&serviceTypeId=1&TechnicalId=a02af056-56b5-4552-ae37-7b0669f99308

import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/feature/paid_services/data/model/service_request_model.dart';

abstract class BaseServiceRequestAutomaticRemoteDataSource {
  Future<ServiceRequestModel> createAutomaticRequestForWinch({
    required int serviceTypeId,
    required String typeOfWinch,
    required double userLatitude,
    required double userLongitude,
    required double servicePrice,
  });
  Future<ServiceRequestModel> createAutomaticRequestForOil({
    required int serviceTypeId,
    required String typeOfOil,
    required double userLatitude,
    required double userLongitude,
    required double servicePrice,
  });
  Future<ServiceRequestModel> createAutomaticRequestForTire({
    required int serviceTypeId,
    required String tireSize,
    required double userLatitude,
    required int serviceQuantity,
    required double userLongitude,
    required double servicePrice,
  });
  Future<ServiceRequestModel> createAutomaticRequestForBatteries({
    required int serviceTypeId,
    required String typeOfBattery,
    required double userLatitude,
    required double userLongitude,
    required double servicePrice,
    required int serviceQuantity,
  });
  Future<ServiceRequestModel> createAutomaticRequestForFuel({
    required int serviceTypeId,
    required String typeOfFuel,
    required double userLatitude,
    required double userLongitude,
    required double servicePrice,
    required int serviceQuantity,
  });
  Future<ServiceRequestModel> getOrderDetails({
    required int id,
  });
  Future<List<ServiceRequestModel>> getAllOrderDetailsForSpecificUser();
  Future<String> deleteOrder({required int id});
  Future<String> getOrderStatus({required int id});
}

class ServiceRequestAutomaticRemoteDataSource
    extends BaseServiceRequestAutomaticRemoteDataSource {
  ApiConsumer api;
  ServiceRequestAutomaticRemoteDataSource({required this.api});

  @override
  Future<ServiceRequestModel> createAutomaticRequestForBatteries(
      {required int serviceTypeId,
      required String typeOfBattery,
      required double userLatitude,
      required double userLongitude,
      required double servicePrice,
      required int serviceQuantity}) async {
    try {
      dynamic response = await api.post(
        EndPoint.createRequestAutomatic,
        data: {
          ApiKey.serviceTypeId: serviceTypeId,
          ApiKey.bettaryType: typeOfBattery,
          ApiKey.userLatitude: userLatitude,
          ApiKey.userLongitude: userLongitude,
          ApiKey.servicePrice: servicePrice,
          ApiKey.serviceQuantity: serviceQuantity,
        },
      );
      return ServiceRequestModel.formJson(response);
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<ServiceRequestModel> createAutomaticRequestForFuel(
      {required int serviceTypeId,
      required String typeOfFuel,
      required double userLatitude,
      required double userLongitude,
      required double servicePrice,
      required int serviceQuantity}) async {
    try {
      dynamic response = await api.post(
        EndPoint.createRequestAutomatic,
        data: {
          ApiKey.serviceTypeId: serviceTypeId,
          ApiKey.typeOfFuel: typeOfFuel,
          ApiKey.userLatitude: userLatitude,
          ApiKey.userLongitude: userLongitude,
          ApiKey.servicePrice: servicePrice,
          ApiKey.serviceQuantity: serviceQuantity,
        },
      );
      return ServiceRequestModel.formJson(response);
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<ServiceRequestModel> createAutomaticRequestForOil(
      {required int serviceTypeId,
      required String typeOfOil,
      required double userLatitude,
      required double userLongitude,
      required double servicePrice}) async {
    try {
      dynamic response = await api.post(
        EndPoint.createRequestAutomatic,
        data: {
          ApiKey.serviceTypeId: serviceTypeId,
          ApiKey.typeOfOil: typeOfOil,
          ApiKey.userLatitude: userLatitude,
          ApiKey.userLongitude: userLongitude,
          ApiKey.servicePrice: servicePrice,
        },
      );
      return ServiceRequestModel.formJson(response);
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<ServiceRequestModel> createAutomaticRequestForTire(
      {required int serviceTypeId,
      required String tireSize,
      required double userLatitude,
      required int serviceQuantity,
      required double userLongitude,
      required double servicePrice}) async {
    try {
      dynamic response = await api.post(
        EndPoint.createRequestAutomatic,
        data: {
          ApiKey.serviceTypeId: serviceTypeId,
          ApiKey.tireSize: tireSize,
          ApiKey.userLatitude: userLatitude,
          ApiKey.userLongitude: userLongitude,
          ApiKey.servicePrice: servicePrice,
          ApiKey.serviceQuantity: serviceQuantity,
        },
      );
      return ServiceRequestModel.formJson(response);
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<ServiceRequestModel> createAutomaticRequestForWinch(
      {required int serviceTypeId,
      required String typeOfWinch,
      required double userLatitude,
      required double userLongitude,
      required double servicePrice}) async {
    try {
      dynamic response = await api.post(
        EndPoint.createRequestAutomatic,
        data: {
          ApiKey.serviceTypeId: serviceTypeId,
          ApiKey.typeOfWinch: typeOfWinch,
          ApiKey.userLatitude: userLatitude,
          ApiKey.userLongitude: userLongitude,
          ApiKey.servicePrice: servicePrice,
        },
      );
      return ServiceRequestModel.formJson(response);
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<String> deleteOrder({required int id}) async {
    try {
      dynamic response =
          await api.delete(EndPoint.deleteOrCancleForUser + id.toString());
      return response;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<List<ServiceRequestModel>> getAllOrderDetailsForSpecificUser() async {
    try {
      dynamic response = await api.get(EndPoint.getAllRequestesForUser);
      List<ServiceRequestModel> ordersList = (response as List)
          .map((item) => ServiceRequestModel.formJson(item))
          .toList();

      return ordersList;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<ServiceRequestModel> getOrderDetails({required int id}) async {
    try {
      dynamic response =
          await api.get(EndPoint.getRequestDetails + id.toString());
      return ServiceRequestModel.formJson(response);
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<String> getOrderStatus({required int id}) async {
    try {
      dynamic response =
          await api.get(EndPoint.cheeckStatus + id.toString());
      return response['status'];
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }
}
// https://carcareapp.runasp.net/api/ServiceRequest/createAutomaticRequestAutomatic/RequestId=350&serviceTypeId=1&TechnicalId=a02af056-56b5-4552-ae37-7b0669f99308

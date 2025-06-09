import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/feature/paid_services/data/datasource/service_request_automatic_remote_data_source.dart';
import 'package:splash_app/feature/paid_services/domain/enties/service_request_entity.dart';
import 'package:splash_app/feature/paid_services/domain/repo/service_request_automatic_repo.dart';

class ServiceRequestAutomaticRepoImplamentation
    extends ServiceRequestAutomaticRepo {
  BaseServiceRequestAutomaticRemoteDataSource dataSource;
  ServiceRequestAutomaticRepoImplamentation({required this.dataSource});

  @override
  Future<Either<ErrorModel, ServiceRequestEntity>>
      createRequestAutoMaticForWinch({
    required int serviceTypeId,
    required String typeOfWinch,
    required double userLatitude,
    required double userLongitude,
    required double servicePrice,
  }) async {
    try {
      var response = await dataSource.createAutomaticRequestForWinch(
        serviceTypeId: serviceTypeId,
        typeOfWinch: typeOfWinch,
        userLatitude: userLatitude,
        userLongitude: userLongitude,
        servicePrice: servicePrice,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, ServiceRequestEntity>>
      createRequestAutomaticForBatteries({
    required int serviceTypeId,
    required String typeOfBattery,
    required double userLatitude,
    required double userLongitude,
    required double servicePrice,
    required int serviceQuantity,
  }) async {
    try {
      var response = await dataSource.createAutomaticRequestForBatteries(
        serviceTypeId: serviceTypeId,
        typeOfBattery: typeOfBattery,
        userLatitude: userLatitude,
        userLongitude: userLongitude,
        servicePrice: servicePrice,
        serviceQuantity: serviceQuantity,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, ServiceRequestEntity>>
      createRequestAutomaticForFuel({
    required int serviceTypeId,
    required String typeOfFuel,
    required double userLatitude,
    required double userLongitude,
    required double servicePrice,
    required int serviceQuantity,
  }) async {
    try {
      var response = await dataSource.createAutomaticRequestForFuel(
        serviceTypeId: serviceTypeId,
        typeOfFuel: typeOfFuel,
        userLatitude: userLatitude,
        userLongitude: userLongitude,
        servicePrice: servicePrice,
        serviceQuantity: serviceQuantity,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, ServiceRequestEntity>>
      createRequestAutomaticForOil({
    required int serviceTypeId,
    required String typeOfOil,
    required double userLatitude,
    required double userLongitude,
    required double servicePrice,
  }) async {
    try {
      var response = await dataSource.createAutomaticRequestForOil(
        serviceTypeId: serviceTypeId,
        typeOfOil: typeOfOil,
        userLatitude: userLatitude,
        userLongitude: userLongitude,
        servicePrice: servicePrice,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, ServiceRequestEntity>>
      createRequestAutomaticForTire({
    required int serviceTypeId,
    required String tireSize,
    required double userLatitude,
    required int serviceQuantity,
    required double userLongitude,
    required double servicePrice,
  }) async {
    try {
      var response = await dataSource.createAutomaticRequestForTire(
        serviceTypeId: serviceTypeId,
        tireSize: tireSize,
        userLatitude: userLatitude,
        serviceQuantity: serviceQuantity,
        userLongitude: userLongitude,
        servicePrice: servicePrice,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, String>> deleteOrder({required int id}) async {
    try {
      var response = await dataSource.deleteOrder(id: id);
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, List<ServiceRequestEntity>>>
      getAllOrderDetailsForSpecificUser({required String index}) async {
    try {
      var response = await dataSource.getAllOrderDetailsForSpecificUser( index: index);
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, ServiceRequestEntity>> getOrderDetails(
      {required int id}) async {
    try {
      var response = await dataSource.getOrderDetails(id: id);
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, String>> getOrderStatus({required int id}) async {
    try {
      var response = await dataSource.getOrderStatus(id: id);
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }
}

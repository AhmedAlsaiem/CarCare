import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/feature/paid_services/data/datasource/service_request_manual_remote_data_source.dart';
import 'package:splash_app/feature/paid_services/domain/enties/service_request_entity.dart';
import 'package:splash_app/feature/paid_services/domain/repo/service_request_manual_repo.dart';

class ServiceRequestManualRepoImplamentation extends ServiceRequestManualRepo {
  BaseServiceRequestManuallyRemoteDataSource dataSource;
  ServiceRequestManualRepoImplamentation({required this.dataSource});

  @override
  Future<Either<ErrorModel, ServiceRequestEntity>> createRequestForBatteries(
      {required int serviceTypeId,
      required String techId,
      required String typeOfBattery,
      required double userLatitude,
      required double userLongitude,
      required double servicePrice,
      required int serviceQuantity}) async {
    try {
      var response = await dataSource.createRequestForBatteries(
          serviceTypeId: serviceTypeId,
          techId: techId,
          typeOfBattery: typeOfBattery,
          userLatitude: userLatitude,
          userLongitude: userLongitude,
          servicePrice: servicePrice,
          serviceQuantity: serviceQuantity);
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, ServiceRequestEntity>> createRequestForFuel(
      {required int serviceTypeId,
      required String techId,
      required String typeOfFuel,
      required double userLatitude,
      required double userLongitude,
      required double servicePrice,
      required int serviceQuantity}) async {
    try {
      var response = await dataSource.createRequestForFuel(
        serviceTypeId: serviceTypeId,
        techId: techId,
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
  Future<Either<ErrorModel, ServiceRequestEntity>> createRequestForOil(
      {required int serviceTypeId,
      required String techId,
      required String typeOfOil,
      required double userLatitude,
      required double userLongitude,
      required double servicePrice}) async {
    try {
      var response = await dataSource.createRequestForOil(
        serviceTypeId: serviceTypeId,
        techId: techId,
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
  Future<Either<ErrorModel, ServiceRequestEntity>> createRequestForTire(
      {required int serviceTypeId,
      required String techId,
      required String tireSize,
      required double userLatitude,
      required int serviceQuantity,
      required double userLongitude,
      required double servicePrice}) async {
    try {
      var response = await dataSource.createRequestForTire(
        serviceTypeId: serviceTypeId,
        techId: techId,
        tireSize: tireSize,
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
  Future<Either<ErrorModel, ServiceRequestEntity>> createRequestForWinch(
      {required int serviceTypeId,
      required String techId,
      required String typeOfWinch,
      required double userLatitude,
      required double userLongitude,
      required double servicePrice}) async {
    try {
      var response = await dataSource.createRequestForWinch(
        serviceTypeId: serviceTypeId,
        techId: techId,
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
  Future<Either<ErrorModel, ServiceRequestEntity>> updateTechincal(
      {required int serviceTypeId,
      required String techId,
      required String orderId}) async {
    try {
      var response = await dataSource.updateTechincal(
        serviceTypeId: serviceTypeId,
        techId: techId,
        orderId: orderId,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }
}

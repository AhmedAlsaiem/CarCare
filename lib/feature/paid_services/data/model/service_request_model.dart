import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/feature/paid_services/domain/enties/service_request_entity.dart';

class ServiceRequestModel extends ServiceRequestEntity {
  const ServiceRequestModel({
    required super.id,
    required super.techId,
    required super.techJop,
    required super.distance,
    required super.serviceTypeId,
    required super.bettaryYpe,
    required super.typeOfFuel,
    required super.typeOfOil,
    required super.tireSize,
    required super.typeOfWinch,
    required super.serviceQuantity,
    required super.servicePrice,
    required super.userId,
    required super.userLatitude,
    required super.userLongitiude,
    required super.busnissStatus,
    required super.paymentsSatus,
    required super.createdOn,
    required super.createdBy,
    required super.paymentIntentId,
    required super.clientSecret,
    required super.techName,
  });
  factory ServiceRequestModel.formJson(Map<String, dynamic> jsonData) {
    return ServiceRequestModel(
      techName: jsonData[ApiKey.techName],
      id: jsonData[ApiKey.id],
      techId: jsonData[ApiKey.techId],
      techJop: jsonData[ApiKey.techJop],
      distance: jsonData[ApiKey.distance],
      serviceTypeId: jsonData[ApiKey.serviceTypeId],
      bettaryYpe: jsonData[ApiKey.bettaryType],
      typeOfFuel: jsonData[ApiKey.typeOfFuel],
      typeOfOil: jsonData[ApiKey.typeOfOil],
      tireSize: jsonData[ApiKey.tireSize],
      typeOfWinch: jsonData[ApiKey.typeOfWinch],
      serviceQuantity: jsonData[ApiKey.serviceQuantity],
      servicePrice: jsonData[ApiKey.servicePrice],
      userId: jsonData[ApiKey.userId],
      userLatitude:
          double.parse(jsonData[ApiKey.userLatitude].toStringAsFixed(6)),
      userLongitiude:
          double.parse(jsonData[ApiKey.userLongitude].toStringAsFixed(6)),
      busnissStatus: jsonData[ApiKey.busnissStatus],
      paymentsSatus: jsonData[ApiKey.paymentStatus],
      createdOn: jsonData[ApiKey.createdOn],
      createdBy: jsonData[ApiKey.createdBy],
      paymentIntentId: jsonData[ApiKey.paymentIntentId],
      clientSecret: jsonData[ApiKey.clientSecret],
    );
  }
}

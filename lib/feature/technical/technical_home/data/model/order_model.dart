import 'package:splash_app/core/api/end_point.dart';
// ignore: unused_import
import 'package:splash_app/feature/authentaction/domain/entity/user_entities/user_entities.dart';
import 'package:splash_app/feature/technical/technical_home/domain/entity/order_entity.dart';

class OrderModel extends OrderEntity {
  const OrderModel(
      {required super.id,
      required super.techId,
      required super.techName,
      required super.techJop,
      required super.distance,
      required super.serviceTypeId,
      required super.bettaryType,
      required super.typeOfFuel,
      required super.typeOfOil,
      required super.tireSize,
      required super.typeOfWinch,
      required super.serviceQuantity,
      required super.servicePrice,
      required super.userId,
      required super.userName,
      required super.userLatitude,
      required super.userLongitude,
      required super.busnissStatus,
      required super.paymentStatus,
      required super.createdBy,
      required super.createdOn,
      required super.paymentIntentId,
      required super.clientSecret});
  factory OrderModel.fromJson(Map<String, dynamic> jsonData) {
    return OrderModel(
        id: jsonData[ApiKey.orderId],
        techId: jsonData[ApiKey.techId],
        techName: jsonData[ApiKey.techName],
        techJop: jsonData[ApiKey.techJop],
        distance: jsonData[ApiKey.distance],
        serviceTypeId: jsonData[ApiKey.serviceTypeId],
        bettaryType: jsonData[ApiKey.bettaryType],
        typeOfFuel: jsonData[ApiKey.typeOfFuel],
        typeOfOil: jsonData[ApiKey.typeOfOil],
        tireSize: jsonData[ApiKey.tireSize],
        typeOfWinch: jsonData[ApiKey.typeOfWinch],
        serviceQuantity: jsonData[ApiKey.serviceQuantity],
        servicePrice: jsonData[ApiKey.servicePrice],
        userId: jsonData[ApiKey.userIdorder],
        userName: jsonData[ApiKey.userName],
        userLatitude: jsonData[ApiKey.userLatitude],
        userLongitude: jsonData[ApiKey.userLongitude],
        busnissStatus: jsonData[ApiKey.busnissStatus],
        paymentStatus: jsonData[ApiKey.paymentStatus],
        createdBy: jsonData[ApiKey.createdBy],
        createdOn: jsonData[ApiKey.createdOn],
        paymentIntentId: jsonData[ApiKey.paymentIntentId],
        clientSecret: jsonData[ApiKey.clientSecret],);
  }
}

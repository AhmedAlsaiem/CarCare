import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final int id;
  final String techId;
  final String techName;
  final String techJop;
  final double distance;
  final int serviceTypeId;
  final String bettaryType;
  final String typeOfFuel;
  final String typeOfOil;
  final String tireSize;
  final String typeOfWinch;
  final int serviceQuantity;
  final double servicePrice;
  final String userId;
  final String userName;
  final double userLatitude;
  final double userLongitude;
  final String busnissStatus;
  final String paymentStatus;
  final String createdBy;
  final String createdOn;
  final String paymentIntentId;
  final String clientSecret;

  const OrderEntity({
    required this.id,
    required this.techId,
    required this.techName,
    required this.techJop,
    required this.distance,
    required this.serviceTypeId,
    required this.bettaryType,
    required this.typeOfFuel,
    required this.typeOfOil,
    required this.tireSize,
    required this.typeOfWinch,
    required this.serviceQuantity,
    required this.servicePrice,
    required this.userId,
    required this.userName,
    required this.userLatitude,
    required this.userLongitude,
    required this.busnissStatus,
    required this.paymentStatus,
    required this.createdBy,
    required this.createdOn,
    required this.paymentIntentId,
    required this.clientSecret,
  });

  @override
  List<Object?> get props => [
        id,
        techId,
        techName,
        techJop,
        distance,
        serviceTypeId,
        bettaryType,
        typeOfFuel,
        typeOfOil,
        tireSize,
        typeOfWinch,
        serviceQuantity,
        servicePrice,
        userId,
        userName,
        userLatitude,
        userLongitude,
        busnissStatus,
        paymentStatus,
        createdBy,
        createdOn,
        paymentIntentId,
        clientSecret,
      ];
}


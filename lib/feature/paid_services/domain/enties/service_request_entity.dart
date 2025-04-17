import 'package:equatable/equatable.dart';

class ServiceRequestEntity extends Equatable {
  final int id;
  final String techId;
  final String techJop;
  final double distance;
  final int serviceTypeId;
  final String bettaryYpe;
  final String typeOfFuel;
  final String typeOfOil;
  final String tireSize;
  final String typeOfWinch;
  final int serviceQuantity;
  final double servicePrice;
  final String userId;
  final double userLatitude;
  final double userLongitiude;
  final String busnissStatus;
  final String paymentsSatus;
  final String createdOn;
  final String createdBy;
  final String paymentIntentId;
  final String clientSecret;

  const ServiceRequestEntity({
    required this.id,
    required this.techId,
    required this.techJop,
    required this.distance,
    required this.serviceTypeId,
    required this.bettaryYpe,
    required this.typeOfFuel,
    required this.typeOfOil,
    required this.tireSize,
    required this.typeOfWinch,
    required this.serviceQuantity,
    required this.servicePrice,
    required this.userId,
    required this.userLatitude,
    required this.userLongitiude,
    required this.busnissStatus,
    required this.paymentsSatus,
    required this.createdOn,
    required this.createdBy,
    required this.paymentIntentId,
    required this.clientSecret,
  });

  @override
  List<Object?> get props => [
        id,
        techId,
        techJop,
        distance,
        serviceTypeId,
        bettaryYpe,
        typeOfFuel,
        typeOfOil,
        tireSize,
        typeOfWinch,
        serviceQuantity,
        servicePrice,
        userId,
        userLatitude,
        userLongitiude,
        busnissStatus,
        paymentsSatus,
        createdOn,
        createdBy,
        paymentIntentId,
        clientSecret,
      ];
}

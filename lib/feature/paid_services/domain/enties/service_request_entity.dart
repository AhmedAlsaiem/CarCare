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
  final String createdBt;
  final String paymentIntentId;
  final String clientSecret;

  const ServiceRequestEntity(
    this.id,
    this.techId,
    this.techJop,
    this.distance,
    this.serviceTypeId,
    this.bettaryYpe,
    this.typeOfFuel,
    this.typeOfOil,
    this.tireSize,
    this.typeOfWinch,
    this.serviceQuantity,
    this.servicePrice,
    this.userId,
    this.userLatitude,
    this.userLongitiude,
    this.busnissStatus,
    this.paymentsSatus,
    this.createdOn,
    this.createdBt,
    this.paymentIntentId,
    this.clientSecret,
  );

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
        createdBt,
        paymentIntentId,
        clientSecret,
      ];
}

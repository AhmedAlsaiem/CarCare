import 'package:equatable/equatable.dart';

class ProfileTecnicalEntity extends Equatable {

  final String nationalId;
  final String serviceName;
  final double profit;
  final int techLatitude;
  final double techLongitude;
  final double techRate;
  final int completedRequestes;
  final String id;
  final String fullName;
  final String phoneNumber;
  final String email;
  final String type;
   final String token; 
   final String refreshToken;

  final String refreshTokenExpirationDate;
 

 const  ProfileTecnicalEntity({
    required this.nationalId,
    required this.completedRequestes,
    required this.email,
    required this.fullName,
    required this.id,
    required this.phoneNumber,
    required this.profit,
    required this.refreshToken,
    required this.refreshTokenExpirationDate,
    required this.serviceName,
    required this.techLatitude,
    required this.techLongitude,
    required this.techRate,
    required this.token,
    required this.type,
   
  });

  @override
  List<Object?> get props => [
        nationalId,
  serviceName,
    techLatitude,
    profit,
    techLongitude,
    techRate,
    completedRequestes,
    id,
    fullName,
    phoneNumber,
    email,
    type,
    token,
    refreshToken,
    refreshTokenExpirationDate,
      ];
}


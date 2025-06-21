import 'package:splash_app/core/api/end_point.dart';
// ignore: unused_import
import 'package:splash_app/feature/authentaction/domain/entity/user_entities/user_entities.dart';
import 'package:splash_app/feature/technical/technical_setting/domain/entity/profile_tecnical_entity.dart';

class TecnicalProfileModel extends ProfileTecnicalEntity {
  const TecnicalProfileModel({
    required super.id,
    required super.completedRequestes,
    required super.email,
    required super.fullName,
    required super.nationalId,
    required super.phoneNumber,
    required super.profit,
    required super.refreshToken,
    required super.refreshTokenExpirationDate,
    required super.serviceName,
    required super.techLatitude,
    required super.techLongitude,
    required super.techRate,
    required super.token,
    required super.type,
  });
  factory TecnicalProfileModel.fromJson(Map<String, dynamic> jsonData) {
    return TecnicalProfileModel(
      id: jsonData[ApiKey.idTecnical],
      completedRequestes: jsonData[ApiKey.completedRequestes] ??0,
      email: jsonData[ApiKey.emailTecnical],
      fullName: jsonData[ApiKey.fullNameTecnical],
      nationalId: jsonData[ApiKey.nationalIdTecnical],
      phoneNumber: jsonData[ApiKey.phoneNumberTecnical],
      profit: jsonData[ApiKey.profit],
      refreshToken: jsonData[ApiKey.refreshTokenTecnical],
      refreshTokenExpirationDate:
          jsonData[ApiKey.refreshTokenExpirationDateTecnical],
      serviceName: jsonData[ApiKey.serviceNameTecnical],
      techLatitude: jsonData[ApiKey.techLatitude],
      techLongitude: jsonData[ApiKey.techLongitude],
      techRate: jsonData[ApiKey.techRate],
      token: jsonData[ApiKey.tokenTecnical],
      type: jsonData[ApiKey.type],
    );
  }
}

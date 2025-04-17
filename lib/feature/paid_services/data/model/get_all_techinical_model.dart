import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/feature/paid_services/domain/enties/get_techincal_entity.dart';

class GetAllTechinicalModel extends GetTechincalEntity {
  const GetAllTechinicalModel({
    required super.nationalId,
    required super.name,
    required super.serviceName,
    required super.type,
    required super.id,
    required super.email,
    required super.distance,
    required super.phoneNumber,
  });
  factory GetAllTechinicalModel.fromJson(Map<String, dynamic> jsonData) {
    return GetAllTechinicalModel(
      nationalId: jsonData[ApiKey.nationalId],
      name: jsonData[ApiKey.fullName],
      serviceName: jsonData[ApiKey.nameOfService],
      type: jsonData[ApiKey.type],
      id: jsonData[ApiKey.id],
      email: jsonData[ApiKey.email],
      distance: jsonData[ApiKey.distance],
      phoneNumber: jsonData[ApiKey.phoneNumber],
    );
  }
}

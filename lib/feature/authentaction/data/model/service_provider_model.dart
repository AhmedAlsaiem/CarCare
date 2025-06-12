import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/feature/authentaction/domain/entity/service_provider_entities/service_provider.dart';

class ServiceProviderModel extends ServiceProviderEntity {
  const ServiceProviderModel({
    required super.token,
    required super.refreshToken,
    required super.refreshTokenExpirationDate,
    required super.phoneNumber,
    required super.email,
    required super.userName,
    required super.type,
    required super.id,
  });
  factory ServiceProviderModel.fromJson(Map<String, dynamic> jsonData) {
    return ServiceProviderModel(
        token: jsonData[ApiKey.token],
        refreshToken: '',
        refreshTokenExpirationDate:'',
        phoneNumber: jsonData[ApiKey.phoneNumber],
        email: jsonData[ApiKey.email],
        userName: jsonData[ApiKey.fullName],
        type: jsonData[ApiKey.type],
        id: jsonData[ApiKey.id]);
  }
}

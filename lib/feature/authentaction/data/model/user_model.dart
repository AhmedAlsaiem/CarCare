import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/feature/authentaction/domain/entity/user_entities/user.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.phoneNumber,
    required super.token,
    required super.refreshToken,
    required super.refreshTokenExpirationDate,
    required super.email,
    required super.userName,
    required super.type,
    required super.id,
  });
  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      token: jsonData[ApiKey.token],
      refreshTokenExpirationDate: jsonData[ApiKey.refreshTokenExpirationDate],
      refreshToken: jsonData[ApiKey.refreshToken],
      phoneNumber: jsonData[ApiKey.phoneNumber],
      email: jsonData[ApiKey.email],
      userName: jsonData[ApiKey.fullName],
      type: jsonData[ApiKey.type],
      id: jsonData[ApiKey.id],
    );
  }
}

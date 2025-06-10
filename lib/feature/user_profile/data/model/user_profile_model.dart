import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/feature/user_profile/domain/entities/user_profile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  const UserProfileModel({
    required super.token,
    required super.phoneNumber,
    required super.email,
    required super.userName,
    required super.type,
    required super.id,
  });
  factory UserProfileModel.fromJson(Map<String, dynamic> jsonData) {
    return UserProfileModel(
      token: jsonData[ApiKey.token],
      phoneNumber: jsonData[ApiKey.phoneNumber],
      email: jsonData[ApiKey.email],
      userName: jsonData[ApiKey.fullName],
      type: jsonData[ApiKey.type],
      id: jsonData[ApiKey.id],
    );
  }
}

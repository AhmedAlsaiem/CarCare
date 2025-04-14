import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/technical/technical_setting/domain/entity/update_profile_entity.dart';

class UpdateProfileModel extends UpdateProfileEntity {
  const UpdateProfileModel({
    required super.name,
    required super.phoneNumber,
    required super.email,
  required super.id,
  });

  factory UpdateProfileModel.fromjson(Map<String, dynamic> jsonDate) {
    return UpdateProfileModel(
      name: jsonDate[ApiKey.fullNameUpdate],
      phoneNumber: jsonDate[ApiKey.phoneNumberUpdate],
      email: jsonDate[ApiKey.emailUpdate],
    id: jsonDate[ApiKey.idUpdate],
    );
  }
}

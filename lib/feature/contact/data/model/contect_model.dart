import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/feature/contact/domain/entities/contact_entity.dart';

class ContectModel extends ContactEntity {
  const ContectModel(
      {required super.id,
      required super.message,
      required super.messageFor,
      required super.createdBy,
      required super.createdOn,
      required super.lastModifiy,
      required super.fullName});
  factory ContectModel.fromJson(Map<String, dynamic> jsonData) {
    return ContectModel(
      id: jsonData[ApiKey.id],
      message: jsonData[ApiKey.message],
      messageFor: jsonData[ApiKey.messageFor],
      createdBy: jsonData[ApiKey.createdBy],
      createdOn: jsonData[ApiKey.createdOn],
      lastModifiy: jsonData[ApiKey.lastModifiedOn],
      fullName: jsonData[ApiKey.fullName],
    );
  }
}

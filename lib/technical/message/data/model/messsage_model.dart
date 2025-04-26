import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/technical/message/domain/entity/message_entity.dart';

class MesssageModel extends MessageEntity {
  const MesssageModel({
    required super.id,
    required super.message,
    required super.createdBy,
    required super.createdOn,
    required super.fullName,
    required super.lastModifiedBy,
    required super.userId,
    required super.lastModifiedon,

   
  });
  factory MesssageModel.fromJson(Map<String, dynamic> jsonData) {
    return MesssageModel(
      id: jsonData[ApiKey.messageId],
      message: jsonData[ApiKey.messages],
      createdBy: jsonData[ApiKey.createdBys],
      createdOn: jsonData[ApiKey.createdOns],
      fullName: jsonData[ApiKey.fullNames],
      lastModifiedBy: jsonData[ApiKey.lastModifiedBy],
      userId: jsonData[ApiKey.userIds],
      lastModifiedon: jsonData[ApiKey.lastModifiedOn],
    );
  }
}
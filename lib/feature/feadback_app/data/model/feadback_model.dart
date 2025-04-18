import 'package:splash_app/core/api/end_point.dart';
// ignore: unused_import
import 'package:splash_app/feature/authentaction/domain/entity/user_entities/user_entities.dart';
import 'package:splash_app/feature/feadback_app/domain/entity/feadback_entities.dart';

class FeadbackModel extends FeadbackEntities {
  const FeadbackModel({
    required super.rating,
    required super.comment,
    required super.id,
  });
  factory FeadbackModel.fromJson(Map<String, dynamic> jsonData) {
    return FeadbackModel(
      rating: jsonData[ApiKey.rating],
      comment: jsonData[ApiKey.comment],
      id: jsonData[ApiKey.id],
    );
  }
}
class GetappFeadbackModel extends GetappFeadBackEntities {
  const GetappFeadbackModel({
    required super.rateing,
   
  });
  factory GetappFeadbackModel.fromJson(double jsonData) {
    return GetappFeadbackModel(
    rateing: jsonData
    );
  }
}

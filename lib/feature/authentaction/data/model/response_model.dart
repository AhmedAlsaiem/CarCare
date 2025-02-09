import 'package:splash_app/core/api/end_point.dart';

class ResponseModel {
  final String masseage;
  final String status;

  ResponseModel({
    required this.masseage,
    required this.status,
  });
  factory ResponseModel.fromJson(Map<String, dynamic> jsonData) {
    return ResponseModel(
        masseage: jsonData[ApiKey.message], status: jsonData[ApiKey.status]);
  }
}

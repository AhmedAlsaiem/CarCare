import 'package:splash_app/core/utils/string_manager.dart';

import '../api/end_point.dart';

class ErrorModel {
  final int statusCode;
  final String errorMessage;
  String? errordata;

  ErrorModel({
    required this.statusCode,
    required this.errorMessage,
    this.errordata,
  });
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      statusCode: jsonData[ApiKey.statusCode] ?? 400,
      errorMessage: jsonData[ApiKey.message] ?? StringsManager.error,
      errordata: jsonData[ApiKey.error] != null
          ? (List<String>.from(jsonData[ApiKey.error])).toString()
          : null,
    );
  }
}

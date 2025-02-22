import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/feature/add_car/domain/entities/car_entity.dart';

class CarModel extends CarEntity {
  final String userId;
  final String userName;

  const CarModel({
    required this.userId,
    required this.userName,
    required super.model,
    required super.id,
    required super.color,
    required super.year,
    required super.vinNumber,
    required super.plateNumber,
  });
  factory CarModel.fromJson({required Map<String, dynamic> jsonData}) {
    return CarModel(
      userId: jsonData[ApiKey.userId],
      userName: jsonData[ApiKey.fullName],
      model: jsonData[ApiKey.model],
      id: jsonData[ApiKey.id],
      color: jsonData[ApiKey.color],
      year: jsonData[ApiKey.year],
      vinNumber: jsonData[ApiKey.vinNumber],
      plateNumber: jsonData[ApiKey.plateNumber],
    );
  }
}

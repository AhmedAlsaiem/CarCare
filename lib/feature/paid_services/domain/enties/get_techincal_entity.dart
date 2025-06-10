import 'package:equatable/equatable.dart';

class GetTechincalEntity extends Equatable {
  final String name;
  final String serviceName;
  final String type;
  final String id;
  final String email;
  final double distance;
  final String phoneNumber;
  final String nationalId;
  const GetTechincalEntity({
    required this.nationalId,
    required this.name,
    required this.serviceName,
    required this.type,
    required this.id,
    required this.email,
    required this.distance,
    required this.phoneNumber,
  });
  @override
  List<Object?> get props => [
        nationalId,
        serviceName,
        type,
        id,
        email,
        distance,
        phoneNumber,
      ];
}

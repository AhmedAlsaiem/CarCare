import 'package:equatable/equatable.dart';

class UpdateProfileEntity extends Equatable {
  final String? name;
  final String phoneNumber;
  final String email;
  final String id;

  const UpdateProfileEntity({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.id,
  });
  @override

  List<Object?> get props =>[
name ,
phoneNumber,
email,
id,
  ];
}

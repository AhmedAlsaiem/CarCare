import 'package:equatable/equatable.dart';

class UserProfileEntity extends Equatable {
  final String phoneNumber;
  final String email;
  final String userName;
  final String type;
  final String id;
  final String token;

  const UserProfileEntity({
    required this.token,
    required this.phoneNumber,
    required this.email,
    required this.userName,
    required this.type,
    required this.id,
  });

  @override
  List<Object?> get props => [
        phoneNumber,
        email,
        userName,
        type,
        id,
        token,
      ];
}

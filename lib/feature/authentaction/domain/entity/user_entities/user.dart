import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String phoneNumber;
  final String email;
  final String userName;
  final String password;
  final int type;
  final String id;

  const UserEntity({
    required this.phoneNumber,
    required this.email,
    required this.userName,
    required this.password,
    required this.type,
    required this.id,
  });

  @override
  List<Object?> get props => [
        phoneNumber,
        email,
        userName,
        password,
        type,
        id,
      ];
}

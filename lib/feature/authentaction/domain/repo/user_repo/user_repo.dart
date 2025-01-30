import 'package:splash_app/feature/authentaction/domain/entity/user_entities/user.dart';

abstract class UserRepo {
  Future<UserEntity> signUp({
    required String phoneNumber,
    required String email,
    required String userName,
    required String password,
    required int type,
  });
  Future<UserEntity> login({
    required String phoneNumber,
    required String password,
  });
  Future<UserEntity> getCurrentUser();
  Future<void> changePassword({
    required String newPassword,
    required String currentPassword,
  });
  Future<void> confirmEmail({
    required String email,
    required int confirmationCode,
  });
  Future<void> getRefreskToken({
    required String token,
    required String refreshToken,
  });
  Future<void> revokeRefreshToken({
    required String token,
    required String refreshToken,
  });
  Future<void> forgetPassword({
    required String email,
  });
  Future<void> verifyCode({
    required String email,
    required int resetcode,
  });
  Future<void> resetPassword({
    required String email,
    required String newPassword,
  });
  Future<void> confirmationCode({
    required String email,
  });
  Future<UserEntity> updateUser({
    required String email,
    required String userName,
    required String phoneNumber,
  });
}

import 'package:splash_app/feature/authentaction/domain/entity/user_entities/user.dart';

abstract class UserRepo {
  Future<UserEntity> signUp({
    final String phoneNumber,
    final String email,
    final String userName,
    final String password,
    final int type,
  });
  Future<UserEntity> login({
    final String phoneNumber,
    final String password,
  });
  Future<UserEntity> getCurrentUser();
  void changePassword({
    final String newPassword,
    currentPassword,
  });
  void confirmEmail({
    final String email,
    confirmationCode,
  });
  void getRefreskToken({
    final String token,
    final String refreshToken,
  });
  void revokeRefreshToken({
    final String token,
    final String refreshToken,
  });
  void forgetPassword({
    final String email,
  });
  void verifyCode({
    final String email,
    final int resetcode,
  });
  void resetPassword(
    final String email,
    newPassword,
  );
  void confirmationCode({
    final String email,
  });
  void updateUser({
    final String email,
    final String userName,
    final String phoneNumber,
  });
}

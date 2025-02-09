import 'package:splash_app/feature/authentaction/domain/repo/user_repo/user_repo.dart';

class ChangePasswordUsecase {
  UserRepo user;
  ChangePasswordUsecase(this.user);
  void excute({
    required String newpassword,
    required String currentPassword,
  }) async {
    return await user.changePassword(
      newPassword: newpassword,
      currentPassword: currentPassword,
    );
  }
}

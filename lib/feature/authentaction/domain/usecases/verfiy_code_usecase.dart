import '../repo/user_repo/user_repo.dart';

class VerfiyCodeUsecase {
  UserRepo user;
  VerfiyCodeUsecase(this.user);
  Future<void >excute({required String email, required int resetCode})async {
    return await user.verifyCode(
      email: email,
      resetcode: resetCode,
    );
  }
}

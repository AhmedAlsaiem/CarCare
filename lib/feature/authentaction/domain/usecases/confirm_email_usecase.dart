import 'package:splash_app/feature/authentaction/domain/repo/user_repo/user_repo.dart';

class ConfirmEmailUsecase {
  UserRepo user;
  ConfirmEmailUsecase(this.user);
  Future<void> excute({required String email, required int confirmationCode})async {
    return await user.confirmEmail(
      email: email,
      confirmationCode: confirmationCode,
    );
  }
}

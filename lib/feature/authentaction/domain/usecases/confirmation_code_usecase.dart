import 'package:splash_app/feature/authentaction/domain/repo/user_repo/user_repo.dart';

class ConfirmationCodeUsecase {
  UserRepo user;
  ConfirmationCodeUsecase(this.user);
  Future<void> excute({required String email})async {
    return await user.confirmationCode(email: email);
  }
}

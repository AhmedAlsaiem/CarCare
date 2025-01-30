import 'package:splash_app/feature/authentaction/domain/repo/user_repo/user_repo.dart';

class ForgetPasswordUsecase {
  UserRepo user;
  ForgetPasswordUsecase(this.user);
  Future<void> excute({required  String email}) async{
    return await user.forgetPassword(email: email);
  }
}
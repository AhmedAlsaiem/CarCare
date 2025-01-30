import 'package:splash_app/feature/authentaction/domain/entity/user_entities/user.dart';
import 'package:splash_app/feature/authentaction/domain/repo/user_repo/user_repo.dart';

class SignupUsecase {
  UserRepo user;
  SignupUsecase(this.user);
  Future<UserEntity> excute ({
    required String email,
    required String password,
    required String userName,
    required int type,
    required String phoneNumber,
  })async {
    return await user.signUp(
      email: email,
      password: password,
      userName: userName,
      type: type,
      phoneNumber: phoneNumber,
    );
  }
}

import 'package:splash_app/feature/authentaction/domain/entity/user_entities/user.dart';

import '../repo/user_repo/user_repo.dart';

class UpdateUserUsecase {
  UserRepo user;
  UpdateUserUsecase(this.user);
  Future<UserEntity> excute(
      {required String email,
      required String userName,
      required String phoneNumber}) async{
    return await user.updateUser(
      email: email,
      userName: userName,
      phoneNumber: phoneNumber,
    );
  }
}

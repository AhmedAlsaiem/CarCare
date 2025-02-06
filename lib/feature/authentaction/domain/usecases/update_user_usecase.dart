import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/authentaction/domain/entity/user_entities/user_entities.dart';

import '../repo/user_repo/user_repo.dart';

class UpdateUserUsecase {
  UserRepo user;
  UpdateUserUsecase(this.user);
   Future< Either<ErrorModel, UserEntity>> excute(
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

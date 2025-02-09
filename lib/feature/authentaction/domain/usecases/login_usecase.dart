import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/authentaction/domain/entity/user_entities/user_entities.dart';
import 'package:splash_app/feature/authentaction/domain/repo/user_repo/user_repo.dart';

class LoginUsecase {
  UserRepo user;
  LoginUsecase(this.user);
  Future< Either<ErrorModel, UserEntity>> excute(
      {required String phoneNumber, required String password})async {
    return  await user.login(
      phoneNumber: phoneNumber,
      password: password,
    );
  }
}

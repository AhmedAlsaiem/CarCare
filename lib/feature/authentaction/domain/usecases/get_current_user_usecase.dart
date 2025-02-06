import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/authentaction/domain/entity/user_entities/user_entities.dart';
import 'package:splash_app/feature/authentaction/domain/repo/user_repo/user_repo.dart';

class GetCurrentUserUsecase {
  UserRepo user;
  GetCurrentUserUsecase(this.user);
   Future< Either<ErrorModel, UserEntity>> excute({required email})async {
    return await user.getCurrentUser();
  }
}

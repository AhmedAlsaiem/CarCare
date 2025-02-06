import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/authentaction/domain/repo/user_repo/user_repo.dart';

import '../entity/user_entities/user_entities.dart';

class ResetPasswordUsecases {
  final UserRepo repo;

  ResetPasswordUsecases({required this.repo});
  Future<Either<ErrorModel, UserEntity>> excute(
      {required String email, required String newPassword}) async{
    return await repo.resetPassword(email: email, newPassword: newPassword);
  }
}

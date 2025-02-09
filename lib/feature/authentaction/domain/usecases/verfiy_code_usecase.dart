import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/authentaction/data/model/response_model.dart';

import '../repo/user_repo/user_repo.dart';

class VerfiyCodeUsecase {
  UserRepo user;
  VerfiyCodeUsecase(this.user);
    Future<Either<ErrorModel,ResponseModel>>excute({required String email, required int resetCode})async {
    return await user.verifyCode(
      email: email,
      resetcode: resetCode,
    );
  }
}

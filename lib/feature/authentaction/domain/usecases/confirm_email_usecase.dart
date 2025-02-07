import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/authentaction/data/model/response_model.dart';
import 'package:splash_app/feature/authentaction/domain/repo/user_repo/user_repo.dart';

class ConfirmEmailUsecase {
  UserRepo user;
  ConfirmEmailUsecase(this.user);
 Future<Either<ErrorModel,ResponseModel>> excute({required String email, required int confirmationCode})async {
    return await user.confirmEmail(
      email: email,
      confirmationCode: confirmationCode,
    );
  }
}

import 'package:splash_app/feature/authentaction/domain/entity/user_entities/user.dart';
import 'package:splash_app/feature/authentaction/domain/repo/user_repo/user_repo.dart';

class GetCurrentUserUsecase {
  UserRepo user;
  GetCurrentUserUsecase(this.user);
  Future<UserEntity> excute({required email})async {
    return await user.getCurrentUser();
  }
}

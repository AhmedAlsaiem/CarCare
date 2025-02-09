import 'package:splash_app/feature/authentaction/domain/repo/user_repo/user_repo.dart';

class GetRefreskTokenUsecase {
  UserRepo user;
  GetRefreskTokenUsecase(this.user);
  Future<void> excute({required String token, required String refreshToken}) async{
    return await user.getRefreskToken(
      token: token,
      refreshToken: refreshToken,
    );
  }
}

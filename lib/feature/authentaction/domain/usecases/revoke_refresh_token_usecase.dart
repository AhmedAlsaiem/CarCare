import 'package:splash_app/feature/authentaction/domain/repo/user_repo/user_repo.dart';

class RevokeRefreshTokenUsecase {
  UserRepo user;
  RevokeRefreshTokenUsecase(this.user);
  Future<void> excute({required String token, required refreshToken})async {
    return await user.revokeRefreshToken(
      token: token,
      refreshToken: refreshToken,
    );
  }
}

import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/technical/technical_setting/domain/entity/update_profile_entity.dart';
import 'package:splash_app/technical/technical_setting/domain/repo/update_profile_repo.dart';

class UpdateProfileUseCase {
  UpdateProfileRepo updateProfileRepo;
  UpdateProfileUseCase({required this.updateProfileRepo});

  Future<Either<ErrorModel, UpdateProfileEntity>> excute({
    required String email,
    required String userName,
    required String phoneNumber,
   required String nationalId,
  }) async {
    return await updateProfileRepo.updateProfile(
      email: email,
      name: userName,
      phoneNumber: phoneNumber,
       id: nationalId,
    );
  }
}

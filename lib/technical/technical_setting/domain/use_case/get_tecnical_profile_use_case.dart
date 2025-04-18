import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/technical/technical_setting/domain/entity/profile_tecnical_entity.dart';
import 'package:splash_app/technical/technical_setting/domain/repo/tecnical_profile_repo.dart';

class GetTecnicalProfileUseCase {
  TecnicalProfileRepo tecnicalProfileRepo;
  GetTecnicalProfileUseCase(this.tecnicalProfileRepo);
  Future<Either<ErrorModel, ProfileTecnicalEntity>> execute()
 async {
    return await tecnicalProfileRepo.getTecnicalProfile();
  }
}

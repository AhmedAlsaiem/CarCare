import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/feadback_app/domain/entity/feadback_entities.dart';
import 'package:splash_app/feature/feadback_app/domain/repo/feadback_repo.dart';

class GetappFeadbackUsecase {
  FeadbackRepo feadbackRepo;
  GetappFeadbackUsecase(this.feadbackRepo);
  Future<Either<ErrorModel, GetappFeadBackEntities>> excute() async {
    return await feadbackRepo.getappFeadBack();
  }
}

import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/feadback_app/domain/entity/feadback_entities.dart';
import 'package:splash_app/feature/feadback_app/domain/repo/feadback_repo.dart';

class UpdateFeadbackUsecase {
  FeadbackRepo feadbackRepo;
  UpdateFeadbackUsecase(this.feadbackRepo);
  Future< Either<ErrorModel, FeadbackEntities>> excute(
      {required int id , required double rating, required String comment})async {
    return  await feadbackRepo.updateFeadBack(id: id, rating: rating, comment: comment);
  }
}



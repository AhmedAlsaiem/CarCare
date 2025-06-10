import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/feadback_app/domain/entity/feadback_entities.dart';
import 'package:splash_app/feature/feadback_app/domain/repo/feadback_repo.dart';

class CreateFeadbackUsecase {
  FeadbackRepo feadbackRepo;
  CreateFeadbackUsecase(this.feadbackRepo);
  Future< Either<ErrorModel, FeadbackEntities>> excute(
      {required double rating, required String comment})async {
    return  await feadbackRepo.creatFeadBack(comment: comment,rating: rating,
    
    );
  }
}



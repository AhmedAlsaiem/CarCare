import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/feadback_app/domain/entity/feadback_entities.dart';

abstract class FeadbackRepo {
  Future<Either<ErrorModel, FeadbackEntities>> creatFeadBack({
    required double rating,
    required String comment,
  });
  Future<Either<ErrorModel, FeadbackEntities>> getFeadBack({
    required int id,
  });
  Future<Either<ErrorModel, GetappFeadBackEntities>> getappFeadBack();
  Future<Either<ErrorModel, FeadbackEntities>> updateFeadBack({
    required double rating,
    required String comment,
    required int id,
  });
 
}

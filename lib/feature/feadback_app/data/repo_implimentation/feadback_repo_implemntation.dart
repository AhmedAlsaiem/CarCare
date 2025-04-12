import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/feature/feadback_app/data/datasourse/feadback_remote_data_sourse.dart';
import 'package:splash_app/feature/feadback_app/data/model/feadback_model.dart';
import 'package:splash_app/feature/feadback_app/domain/entity/feadback_entities.dart';
import 'package:splash_app/feature/feadback_app/domain/repo/feadback_repo.dart';

class FeadbackRepoImplemntation extends FeadbackRepo {
  BaseFaedbackRemoteDataSource baseFaedbackRemoteDataSource;
  FeadbackRepoImplemntation({required this.baseFaedbackRemoteDataSource});

  @override
  Future<Either<ErrorModel, FeadbackEntities>> creatFeadBack(
      {required double rating, required String comment}) async {
    try {
      FeadbackModel feadbackModel = await baseFaedbackRemoteDataSource
          .creatFeadback(comment: comment, rating: rating);
      return right(feadbackModel);
    } on ServerException catch (e) {
      return left(ErrorModel(
          statusCode: e.errModel.statusCode,
          errorMessage: e.errModel.errorMessage));
    }
  }
  
  @override
  Future<Either<ErrorModel, FeadbackEntities>> getFeadBack(
      {required int id}) async {
    try {
      FeadbackModel feadbackModel = await baseFaedbackRemoteDataSource.getFeadBack(id: id);
     
      return right(feadbackModel);
    } on ServerException catch (e) {
      return left(ErrorModel(
          statusCode: e.errModel.statusCode,
          errorMessage: e.errModel.errorMessage));
    }
  }
  @override
  Future<Either<ErrorModel, GetappFeadBackEntities>> getappFeadBack() async{
    try {
      GetappFeadbackModel getappFeadbackModel = await baseFaedbackRemoteDataSource.getappFeadBack();
     
      return right(getappFeadbackModel);
    } on ServerException catch (e) {
      return left(ErrorModel(
          statusCode: e.errModel.statusCode,
          errorMessage: e.errModel.errorMessage));
    }
  }
  @override
  Future<Either<ErrorModel, FeadbackEntities>> updateFeadBack({required int id, required double rating, required String comment}) async{
     try {
      FeadbackModel feadbackModel = await baseFaedbackRemoteDataSource.updateFeadBack(id: id, rating: rating, comment: comment);
     
      return right(feadbackModel);
    } on ServerException catch (e) {
      return left(ErrorModel(
          statusCode: e.errModel.statusCode,
          errorMessage: e.errModel.errorMessage));
    }
  }
  
  
  
 
  }
  
 

  



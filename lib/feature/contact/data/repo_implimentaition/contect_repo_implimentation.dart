import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/feature/contact/data/datasource/get_contact_remote_datasource.dart';
import 'package:splash_app/feature/contact/domain/entities/contact_entity.dart';
import 'package:splash_app/feature/contact/domain/repo/contect_repo.dart';

class ContectRepoImplimentation extends ContectRepo {
  BaseGetContactRemoteDatasource baseGetContactRemoteDatasource;
  ContectRepoImplimentation({required this.baseGetContactRemoteDatasource});
  @override
  Future<Either<ErrorModel, List<ContactEntity>>> getAllContacts() async {
    try {
      List<ContactEntity> contectList =
          await baseGetContactRemoteDatasource.getAllconactes();
      return Right(contectList);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }
}

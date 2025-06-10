import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/technical/technical_setting/data/datasourse/tecnical_profile_data_sourse.dart';
import 'package:splash_app/technical/technical_setting/data/moedel/tecnical_profile_model.dart';
import 'package:splash_app/technical/technical_setting/domain/entity/profile_tecnical_entity.dart';
import 'package:splash_app/technical/technical_setting/domain/repo/tecnical_profile_repo.dart';

class TecnicalProfileRepoImplemantion extends TecnicalProfileRepo {
  BaseTecnicalProfileRemoteDataSource baseTecnicalProfileRemoteDataSource;
  TecnicalProfileRepoImplemantion(
      {required this.baseTecnicalProfileRemoteDataSource});

  @override
  Future<Either<ErrorModel, ProfileTecnicalEntity>> getTecnicalProfile() async {
    try {
      TecnicalProfileModel tecnicalProfileModel =
          await baseTecnicalProfileRemoteDataSource.getTecnicalProfile();
      return right(tecnicalProfileModel);
    } on ServerException catch (e) {
      return left(ErrorModel(
          statusCode: e.errModel.statusCode,
          errorMessage: e.errModel.errorMessage));
    }
  }
}

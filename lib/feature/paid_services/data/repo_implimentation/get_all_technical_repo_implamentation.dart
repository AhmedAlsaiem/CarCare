import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/feature/paid_services/data/datasource/get_all_techinical_remote_data_source.dart';
import 'package:splash_app/feature/paid_services/domain/enties/get_techincal_entity.dart';
import 'package:splash_app/feature/paid_services/domain/repo/get_all_techinical_for_order_repo.dart';

class GetAllTechnicalRepoImplamentation extends GetAllTechinicalForOrderRepo {
  BaseGetAllTechinicalRemoteDataSource baseGetAllTechinicalRemoteDataSource;
  GetAllTechnicalRepoImplamentation(
      {required this.baseGetAllTechinicalRemoteDataSource});
  @override
  Future<Either<ErrorModel, List<GetTechincalEntity>>>
      getAllTechincalOrderedByDistance(
          {required double userLatidude,
          required double userLangtude,
          required int serviceId}) async {
    try {
      List<GetTechincalEntity> techinicalList =
          await baseGetAllTechinicalRemoteDataSource
              .getAllTechinicalOrderedByDistanceUseCases(
                  userLatidude: userLatidude,
                  userLangtude: userLangtude,
                  serviceId: serviceId);
      return right(techinicalList);
    } on ServerException catch (e) {
      return left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, List<GetTechincalEntity>>>
      getAllTechincalOrderedByRateAndDistance(
          {required double userLatidude,
          required double userLangtude,
          required int serviceId}) async {
    try {
      List<GetTechincalEntity> techinicalList =
          await baseGetAllTechinicalRemoteDataSource
              .getAllTechinicalOrderedByDistanceUseCases(
                  userLatidude: userLatidude,
                  userLangtude: userLangtude,
                  serviceId: serviceId);
      return right(techinicalList);
    } on ServerException catch (e) {
      return left(e.errModel);
    }
  }
}

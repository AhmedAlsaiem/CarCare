import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/paid_services/domain/enties/get_techincal_entity.dart';

abstract class GetAllTechinicalForOrderRepo {
  Future<Either<ErrorModel,List< GetTechincalEntity>>>
      getAllTechincalOrderedByRateAndDistance({
    required double userLatidude,
    required double userLangtude,
    required int serviceId,
  });
  Future<Either<ErrorModel,List< GetTechincalEntity>>>
      getAllTechincalOrderedByDistance({
    required double userLatidude,
    required double userLangtude,
    required int serviceId,
  });
}

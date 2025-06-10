import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/paid_services/domain/enties/get_techincal_entity.dart';
import 'package:splash_app/feature/paid_services/domain/repo/get_all_techinical_for_order_repo.dart';

class GetAllTechinicalOrderedByDistance {
  GetAllTechinicalForOrderRepo repo;
  GetAllTechinicalOrderedByDistance({required this.repo});
  Future<Either<ErrorModel, List<GetTechincalEntity>>> excute({
    required double userLatidude,
    required double userLangtude,
    required int serviceId,
  }) {
    return repo.getAllTechincalOrderedByDistance(
      userLatidude: userLatidude,
      userLangtude: userLangtude,
      serviceId: serviceId,
    );
  }
}

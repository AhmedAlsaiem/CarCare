import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/feature/authentaction/data/datasource/get_all_services._datasource.dart';
import 'package:splash_app/feature/authentaction/domain/entity/service_entities/service_entitiy.dart';
import 'package:splash_app/feature/authentaction/domain/repo/get_all_services_repo/get_all_services_repo.dart';

class GetAllServicesRepoImplementation extends GetAllServicesRepo {
  BaseGetAllSErvicesRemoteDataSource baseGetAllSErvicesRemoteDataSource;
  GetAllServicesRepoImplementation(
      {required this.baseGetAllSErvicesRemoteDataSource});
  @override
  Future<Either<ErrorModel, List<ServiceEntitiy>>> getAllSErvices() async {
    try {
      List<ServiceEntitiy> servicesList =
          await baseGetAllSErvicesRemoteDataSource.getAllServices();
      return Right(servicesList);
    } on ServerException catch (e) {
      return left(ErrorModel(
          statusCode: e.errModel.statusCode,
          errorMessage: e.errModel.errorMessage));
    }
  }
}

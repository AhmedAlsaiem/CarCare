import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/feature/authentaction/data/datasource/service_provider_remote_data_source.dart';
import 'package:splash_app/feature/authentaction/domain/entity/service_provider_entities/service_provider.dart';
import 'package:splash_app/feature/authentaction/domain/repo/service_provider_repo/service_privider_repo.dart';

class ServicePoviderRepoImplemationtion extends ServiceProviderRepo {
  BaseServiceProviderRemoteDataSource baseServiceProviderRemoteDataSource;
  ServicePoviderRepoImplemationtion(
      {required this.baseServiceProviderRemoteDataSource});
  @override
  Future<Either<ErrorModel, ServiceProviderEntity>> servicePrividerSignUp({
    required String email,
    required String password,
    required String userName,
    required String phoneNumber,
    required String nationalId,
  }) async {
    try {
      ServiceProviderEntity response =
          await baseServiceProviderRemoteDataSource.serviceProviderSignUP(
              phoneNumber: phoneNumber,
              email: email,
              userName: userName,
              nationalId: nationalId,
              password: password);
      return right(response);
    } on ServerException catch (e) {
    
      return left(ErrorModel(
          statusCode: e.errModel.statusCode,
          errorMessage: e.errModel.errorMessage,
          errordata: e.errModel.errordata));
    }
  }
}

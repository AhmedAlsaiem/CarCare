import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/authentaction/domain/entity/service_provider_entities/service_provider.dart';
import 'package:splash_app/feature/authentaction/domain/repo/service_provider_repo/service_privider_repo.dart';

class ServiceProviderSignupUsecase {
  ServiceProviderRepo repo;
  ServiceProviderSignupUsecase({required this.repo});
  Future<Either<ErrorModel, ServiceProviderEntity>> excute(
      {required String email,
      required String password,
      required String userName,
      required String phoneNumber,
      required String nationalId}) async {
    return await repo.servicePrividerSignUp(
        email: email,
        password: password,
        userName: userName,
        phoneNumber: phoneNumber,
        nationalId: nationalId);
  }
}

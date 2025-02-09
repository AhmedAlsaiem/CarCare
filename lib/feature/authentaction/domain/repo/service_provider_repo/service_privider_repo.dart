import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/authentaction/domain/entity/service_provider_entities/service_provider.dart';

abstract class ServiceProviderRepo {
  Future<Either<ErrorModel, ServiceProviderEntity>> servicePrividerSignUp(
      {required String email,
      required String password,
      required String userName,
      required String phoneNumber,
      required String nationalId});
}

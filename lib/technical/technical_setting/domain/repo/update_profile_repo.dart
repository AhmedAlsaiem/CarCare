import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/technical/technical_setting/domain/entity/update_profile_entity.dart';

abstract class UpdateProfileRepo {
  Future<Either<ErrorModel, UpdateProfileEntity>> updateProfile({
    required String name,
    required String email,
    required String id,
    required String phoneNumber,
  });
}

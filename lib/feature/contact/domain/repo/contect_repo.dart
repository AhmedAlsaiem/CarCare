import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/contact/domain/entities/contact_entity.dart';

abstract class ContectRepo {
  Future<Either<ErrorModel, List<ContactEntity>>> getAllContacts();
}

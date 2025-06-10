import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/contact/domain/repo/contect_repo.dart';

import '../entities/contact_entity.dart';

 class ContactGetAllContactUsecase {
  ContectRepo repo;
  ContactGetAllContactUsecase({required this.repo});
  Future<Either<ErrorModel, List<ContactEntity>>> excute() {
    return repo.getAllContacts();
  }
}

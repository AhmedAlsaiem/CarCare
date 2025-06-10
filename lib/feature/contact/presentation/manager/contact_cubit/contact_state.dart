import 'package:splash_app/feature/contact/domain/entities/contact_entity.dart';

abstract class ContactState {}

class InitContactState extends ContactState {}

class SuccessContactState extends ContactState {
  final List<ContactEntity> contectList;
  SuccessContactState({required this.contectList});
}

class IsLoadingContactState extends ContactState {}

class FailedContactState extends ContactState {
  final String errorMessage;
  FailedContactState({required this.errorMessage});
}

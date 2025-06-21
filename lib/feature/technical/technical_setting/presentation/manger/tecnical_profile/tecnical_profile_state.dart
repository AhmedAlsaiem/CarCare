import 'package:splash_app/feature/technical/technical_setting/domain/entity/profile_tecnical_entity.dart';

class TecnicalProfileState {}

class IsLoadingTecnicalProfileState extends TecnicalProfileState {}

class SuccessTecnicalProfileState extends TecnicalProfileState {
  final ProfileTecnicalEntity tecnicalEntity; // Store list of orders
  final String? successMessage;

  SuccessTecnicalProfileState(this.tecnicalEntity, {this.successMessage});
}

class FaliureTecnicalProfileState extends TecnicalProfileState {
  final String errorMessage;

  FaliureTecnicalProfileState({required this.errorMessage});
}

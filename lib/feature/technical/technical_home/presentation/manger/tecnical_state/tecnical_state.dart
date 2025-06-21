import 'package:splash_app/feature/technical/technical_home/domain/entity/tecnical_state.dart';

class TecnicalState {}

class IsLoadingTecnicalState extends TecnicalState {}

class SuccessTecnicalState extends TecnicalState {
  final TecnicalStateEntity orders; // Store list of orders
  final String? successMessage;

  SuccessTecnicalState(this.orders, {this.successMessage});
}

class FaliureTecnicalState extends TecnicalState {
  final String errorMessage;

  FaliureTecnicalState({required this.errorMessage});
}

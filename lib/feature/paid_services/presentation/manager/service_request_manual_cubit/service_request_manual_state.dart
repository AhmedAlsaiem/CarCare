import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/paid_services/domain/enties/service_request_entity.dart';

abstract class ServiceRequestManualState {}

class ServiceRequestManualInatialState extends ServiceRequestManualState {}

class ServiceRequestManualIsLoadinState extends ServiceRequestManualState {}

class ServiceRequestManualSucessState extends ServiceRequestManualState {
 final ServiceRequestEntity serviceRequestModel;

  ServiceRequestManualSucessState({required this.serviceRequestModel});
}

class ServiceRequestManualFailedState extends ServiceRequestManualState {
  final ErrorModel error;

  ServiceRequestManualFailedState({required this.error});
}

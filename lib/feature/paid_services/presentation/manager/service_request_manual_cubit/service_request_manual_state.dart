import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/paid_services/domain/enties/service_request_entity.dart';

abstract class ServiceRequestState {}

class ServiceRequestInatialState extends ServiceRequestState {}

class ServiceRequestIsLoadinState extends ServiceRequestState {}

class ServiceRequestManualSucessState extends ServiceRequestState {
  final ServiceRequestEntity serviceRequestModel;

  ServiceRequestManualSucessState({required this.serviceRequestModel});
}

class ServiceRequestUpdateSucessState extends ServiceRequestState {
  final ServiceRequestEntity serviceRequestModel;

  ServiceRequestUpdateSucessState({required this.serviceRequestModel});
}

class ServiceRequestSucessState extends ServiceRequestState {
  final String successMessage;

  ServiceRequestSucessState({required this.successMessage});
}

class ServiceRequestFailedState extends ServiceRequestState {
  final ErrorModel error;

  ServiceRequestFailedState({required this.error});
}

class GetAllOrdersSucessState extends ServiceRequestState {
  final List<ServiceRequestEntity> orderList;

  GetAllOrdersSucessState({required this.orderList});
}

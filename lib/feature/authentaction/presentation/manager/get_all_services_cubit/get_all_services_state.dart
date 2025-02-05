import 'package:splash_app/feature/authentaction/domain/entity/service_entities/service_entitiy.dart';

 class GetAllServicesState {}

class GetAllServicesIsLoadingState extends GetAllServicesState {}

class GetAllServicesFaildState extends GetAllServicesState {
  final String erorrMessage;
  GetAllServicesFaildState({required this.erorrMessage});
}

class GetAllServicesSuccessState extends GetAllServicesState {
  List<ServiceEntitiy> servicesList;
  GetAllServicesSuccessState({required this.servicesList});
}

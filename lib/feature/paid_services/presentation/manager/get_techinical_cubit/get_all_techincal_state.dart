import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/paid_services/domain/enties/get_techincal_entity.dart';

abstract class GetAllTechincalState {}

class GetAllTechinicalIntialState extends GetAllTechincalState {}

class GetAllTechinicalIsLoadinState extends GetAllTechincalState {}

class GetAllTechinicalSucessState extends GetAllTechincalState {
  List<GetTechincalEntity> techinicalList;
  GetAllTechinicalSucessState({required this.techinicalList});
}

class GetAllTechinicalFailedState extends GetAllTechincalState {
  final ErrorModel errorMessage;
  GetAllTechinicalFailedState({required this.errorMessage});
}

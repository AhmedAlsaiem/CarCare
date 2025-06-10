import 'package:splash_app/feature/feadback_app/domain/entity/feadback_entities.dart';

class GetAppFeadbackState {}

class IsLoadingGetAppFeadbackState extends GetAppFeadbackState {}

class SuccessGetAppFeadbackState extends GetAppFeadbackState {
  String? successMessage;
  final GetappFeadBackEntities getappFeadBackEntities  ;
  SuccessGetAppFeadbackState(this.getappFeadBackEntities ,this.successMessage);
}

class FaliureGetAppFeadbackState extends GetAppFeadbackState {
  final String errorMessage;

  FaliureGetAppFeadbackState({required this.errorMessage});
}
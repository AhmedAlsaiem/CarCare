import 'package:splash_app/feature/feadback_app/domain/entity/feadback_entities.dart';

class FeadbackState {}

class IsLoadingFeadbackState extends FeadbackState {}

class SuccessFeadbackState extends FeadbackState {
  String successMessage;
  final FeadbackEntities feadbackEntities  ;
  SuccessFeadbackState(this.feadbackEntities ,this.successMessage);
}
class SuccessGetFeadbackState extends FeadbackState {
  String successMessage;
  final FeadbackEntities feadbackEntities  ;
  SuccessGetFeadbackState(this.feadbackEntities ,this.successMessage);
}

class FaliureFeadbackState extends FeadbackState {
  final String errorMessage;

  FaliureFeadbackState({required this.errorMessage});
}

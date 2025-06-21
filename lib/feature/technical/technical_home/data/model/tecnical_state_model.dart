import 'package:splash_app/feature/technical/technical_home/domain/entity/tecnical_state.dart';

class TecnicalStateModel extends TecnicalStateEntity {
  const TecnicalStateModel({required super.message});
  factory TecnicalStateModel.fromJson(String jsonData) {
    return TecnicalStateModel(message:jsonData);
  }
}

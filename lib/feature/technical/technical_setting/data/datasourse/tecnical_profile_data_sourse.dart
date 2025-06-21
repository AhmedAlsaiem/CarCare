import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/feature/technical/technical_setting/data/moedel/tecnical_profile_model.dart';

abstract class BaseTecnicalProfileRemoteDataSource {
  Future<TecnicalProfileModel> getTecnicalProfile();

}

class TecnicalProfileDataSourse extends BaseTecnicalProfileRemoteDataSource {
  ApiConsumer api;
  TecnicalProfileDataSourse(this.api);

  
  @override
  Future<TecnicalProfileModel> getTecnicalProfile() async{
   TecnicalProfileModel tecnicalProfileModel;
    try {
      dynamic response =
          await api.get(EndPoint.getTecnicalPrfile);

tecnicalProfileModel = TecnicalProfileModel.fromJson(response);
     

      return tecnicalProfileModel;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }
}

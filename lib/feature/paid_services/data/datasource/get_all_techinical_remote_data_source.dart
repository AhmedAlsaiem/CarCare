import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/feature/paid_services/data/model/get_all_techinical_model.dart';

abstract class BaseGetAllTechinicalRemoteDataSource {
  Future<List<GetAllTechinicalModel>>
      getAllTechinicalOrderedByDistanceUseCases({
    required double userLatidude,
    required double userLangtude,
    required int serviceId,
  });
  Future<List<GetAllTechinicalModel>>
      getAllTechinicalOrderedByDistanceAndRateUseCases({
    required double userLatidude,
    required double userLangtude,
    required int serviceId,
  });
}

class GetAllTechinicalRemoteDataSource
    extends BaseGetAllTechinicalRemoteDataSource {
  ApiConsumer api;
  GetAllTechinicalRemoteDataSource({required this.api});
  @override
  Future<List<GetAllTechinicalModel>>
      getAllTechinicalOrderedByDistanceAndRateUseCases(
          {required double userLatidude,
          required double userLangtude,
          required int serviceId}) async {
    try {
      dynamic response = await api
          .get(EndPoint.getAllTechinicalOrderedByDistanceAndRateEndPoint +
              handleApiEndPoint(
                id: serviceId,
                userLatidude: userLatidude,
                userLangtude: userLangtude,
              ));
      List<GetAllTechinicalModel> techincalList = (response as List)
          .map((item) => GetAllTechinicalModel.fromJson(item))
          .toList();
      return techincalList;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<List<GetAllTechinicalModel>> getAllTechinicalOrderedByDistanceUseCases(
      {required double userLatidude,
      required double userLangtude,
      required int serviceId}) async {
    try {
      dynamic response =
          await api.get(EndPoint.getAllTechinicalOrderedByDistanceEndPoint +
              handleApiEndPoint(
                id: serviceId,
                userLatidude: userLatidude,
                userLangtude: userLangtude,
              ));
      List<GetAllTechinicalModel> techincalList = (response as List)
          .map((item) => GetAllTechinicalModel.fromJson(item))
          .toList();
      return techincalList;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }
}

String handleApiEndPoint({
  required id,
  required double userLatidude,
  required double userLangtude,
}) {
  return 'serviceId=$id&UserLatitude=$userLatidude&UserLongitude=$userLangtude';
}

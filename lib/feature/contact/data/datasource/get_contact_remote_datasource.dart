import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/feature/contact/data/model/contect_model.dart';

abstract class BaseGetContactRemoteDatasource {
  Future<List<ContectModel>> getAllconactes();
}

class GetContactRemoteDatasource extends BaseGetContactRemoteDatasource {
  final ApiConsumer apiConsumer;
  GetContactRemoteDatasource({required this.apiConsumer});
  @override
  Future<List<ContectModel>> getAllconactes() async {
    try {
      dynamic response = await apiConsumer.get(EndPoint.getAllContacts);
      List<ContectModel> contectList = (response as List)
          .map((item) => ContectModel.fromJson(item))
          .toList();
      return contectList;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }
}

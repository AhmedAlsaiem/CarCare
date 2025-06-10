import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/technical/message/data/model/messsage_model.dart';

abstract class BaseMessageRemoteDataSource {
  Future<List<MesssageModel>> getMessages();
}

class MessageRemoteDataSourse extends BaseMessageRemoteDataSource {
  ApiConsumer api;

  MessageRemoteDataSourse(this.api);
  @override
  Future<List<MesssageModel>> getMessages() async {
    List<MesssageModel> messageModelList;
    try {
      dynamic response =
          await api.get(EndPoint.getMessages);

      if (response is List) {
        messageModelList =
            response.map((json) => MesssageModel.fromJson(json)).toList();
      } else {
        throw ServerException(errModel: response);
      }

      return messageModelList;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }
}
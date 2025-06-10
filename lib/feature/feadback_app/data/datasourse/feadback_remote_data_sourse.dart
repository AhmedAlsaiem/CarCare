import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/error/exception.dart';

import 'package:splash_app/feature/feadback_app/data/model/feadback_model.dart';

abstract class BaseFaedbackRemoteDataSource {
  Future<FeadbackModel> creatFeadback({
    required double rating,
    required String comment,
  });
  Future<FeadbackModel> getFeadBack();
  Future<GetappFeadbackModel> getappFeadBack();

  Future<FeadbackModel> updateFeadBack({
    required int id,
    required double rating,
    required String comment,
  });
}

class FeadbackRemoteDataSourse extends BaseFaedbackRemoteDataSource {
  ApiConsumer api;
  FeadbackRemoteDataSourse(this.api);

  @override

  Future<FeadbackModel> creatFeadback(
      {required double rating, required String comment}) async {
    FeadbackModel feadbackModel;
    try {
      dynamic response = await api.post(EndPoint.creatFeadback, data: {
        ApiKey.rating: rating,
        ApiKey.comment: comment,
      });
      feadbackModel = FeadbackModel.fromJson(response);
      //saveUserData(acount: user);
  //saveIdFeaddback(feadback: feadback)
      return feadbackModel;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<FeadbackModel> getFeadBack() async {
    FeadbackModel feadbackModel;
    try {
      dynamic response = await api.get(EndPoint.getFeedBack);
      feadbackModel = FeadbackModel.fromJson(response);

      return feadbackModel;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<GetappFeadbackModel> getappFeadBack() async {
    GetappFeadbackModel getappFeadbackModel;
    try {
      dynamic response = await api.get(EndPoint.getappFeedBack);
      getappFeadbackModel = GetappFeadbackModel.fromJson(response);

      return getappFeadbackModel;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<FeadbackModel> updateFeadBack(
      {required int id,
      required double rating,
      required String comment}) async {
    FeadbackModel feadbackModel;
    try {
      dynamic response =
          await api.put(EndPoint.updateFeedBack + id.toString(), data: {
        ApiKey.rating: rating,
        ApiKey.comment: comment,
      });
      feadbackModel = FeadbackModel.fromJson(response);
      return feadbackModel;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }
}

// ignore_for_file: avoid_print

import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/technical/technical_home/data/model/order_model.dart';
import 'package:splash_app/technical/technical_home/data/model/tecnical_state_model.dart';

abstract class BaseOrderRemoteDataSource {
  Future<List<OrderModel>> getAllPendingRequestsToTechnical();
  Future<List<OrderModel>> getAllOrders();
  Future<List<OrderModel>> getComplateOrder();


  Future<TecnicalStateModel> setTecnicalActiveState();
  Future<TecnicalStateModel> setTecnicalInctiveState();
  Future<TecnicalStateModel> accpetOrderState({required int id});
  Future<TecnicalStateModel> cancelOrderState({required int id});
  Future<TecnicalStateModel> complateOrderState({required int id});

}

class OderRemoteDataSourse extends BaseOrderRemoteDataSource {
  ApiConsumer api;
  OderRemoteDataSourse(this.api);

  @override
  Future<List<OrderModel>> getAllPendingRequestsToTechnical() async {
    List<OrderModel> orderModelList;
    try {
      dynamic response =
          await api.get(EndPoint.getAllPendingRequestsToTechnical);

      if (response is List) {
        orderModelList =
            response.map((json) => OrderModel.fromJson(json)).toList();
      } else {
        throw ServerException(errModel: response);
      }

      return orderModelList;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }
  @override
  Future<List<OrderModel>> getAllOrders() async {
    List<OrderModel> orderModelList;
    try {
      dynamic response =
          await api.get(EndPoint.getAllOrders );

      if (response is List) {
        orderModelList =
            response.map((json) => OrderModel.fromJson(json)).toList();
      } else {
        throw ServerException(errModel: response);
      }

      return orderModelList;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }
  @override
  Future<List<OrderModel>> getComplateOrder() async {
    List<OrderModel> orderModelList;
    try {
      dynamic response =
          await api.get(EndPoint.getcomplateOrder);

      if (response is List) {
        orderModelList =
            response.map((json) => OrderModel.fromJson(json)).toList();
      } else {
        throw ServerException(errModel: response);
      }

      return orderModelList;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<TecnicalStateModel> setTecnicalActiveState() async {
    TecnicalStateModel tecnicalStateModel;
    try {
      dynamic response = await api.put(EndPoint.techincalBeActive);
      tecnicalStateModel = TecnicalStateModel.fromJson(response);
      //  customShowSnackBar(context, (response.toString()));
      print(response.toString());

      return tecnicalStateModel;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<TecnicalStateModel> setTecnicalInctiveState() async {
    TecnicalStateModel tecnicalStateModel;
    try {
      dynamic response = await api.put(EndPoint.techincalBeInActive);
      tecnicalStateModel = TecnicalStateModel.fromJson(response);
      print(response.toString());
      //  customShowSnackBar(context, (response.toString()));

      return tecnicalStateModel;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<TecnicalStateModel> accpetOrderState({required int id}) async {
    TecnicalStateModel tecnicalStateModel;
    try {
      dynamic response = await api.put(EndPoint.acceptRequest+id.toString());
      tecnicalStateModel = TecnicalStateModel.fromJson(response);
      print(response.toString());
      //  customShowSnackBar(context, (response.toString()));

      return tecnicalStateModel;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }

  @override
  Future<TecnicalStateModel> cancelOrderState({required int id}) async {
    TecnicalStateModel tecnicalStateModel;
    try {
      dynamic response = await api.put(EndPoint.rejectRequest+id.toString());
      tecnicalStateModel = TecnicalStateModel.fromJson(response);
      print(response.toString());
      //  customShowSnackBar(context, (response.toString()));

      return tecnicalStateModel;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }
  @override
  Future<TecnicalStateModel> complateOrderState({required int id}) async {
    TecnicalStateModel tecnicalStateModel;
    try {
      dynamic response = await api.put(EndPoint.completeRequest+id.toString());
      tecnicalStateModel = TecnicalStateModel.fromJson(response);
      print(response.toString());
      //  customShowSnackBar(context, (response.toString()));

      return tecnicalStateModel;
    } on ServerException catch (e) {
      throw ServerException(errModel: e.errModel);
    }
  }
}

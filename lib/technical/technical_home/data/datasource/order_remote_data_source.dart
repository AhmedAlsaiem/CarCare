
import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/technical/technical_home/data/model/order_model.dart';
import 'package:splash_app/technical/technical_home/data/model/tecnical_state_model.dart';

abstract class BaseOrderRemoteDataSource {
  Future<List<OrderModel>> getAllPendingRequestsToTechnical();
  Future<List<OrderModel>> getAllOrders();
  Future<List<OrderModel>> getAllOrdersCancal();
  Future<List<OrderModel>> getAllOrdersComplate();
  Future<List<OrderModel>> getOrderInProgress();

  Future<TecnicalStateModel> setTecnicalActiveState();
  Future<TecnicalStateModel> setTecnicalInctiveState();
  Future<TecnicalStateModel> acceptOrderState({required int id});
  Future<TecnicalStateModel> cancelOrderState({required int id});
  Future<TecnicalStateModel> completeOrderState({required int id});
}

class OrderRemoteDataSource implements BaseOrderRemoteDataSource {
  final ApiConsumer _apiConsumer;
  static const _defaultErrorMessage = 'Failed to process request';

  OrderRemoteDataSource(this._apiConsumer);

  Future<List<OrderModel>> _fetchOrderList(String endpoint) async {
    try {
      final response = await _apiConsumer.get(endpoint);

      if (response is! List) {
        throw ServerException(
            errModel: ErrorModel(
          errorMessage: 'Invalid response format',
          statusCode: 400
        ));
      }

      return response
          .map<OrderModel>((json) => OrderModel.fromJson(json))
          .toList();
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
          errModel:
              ErrorModel(errorMessage: _defaultErrorMessage, statusCode: 400));
    }
  }

  Future<TecnicalStateModel> _processStateChange(
    String endpoint, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _apiConsumer.put(endpoint, data: data);
      return TecnicalStateModel.fromJson(response);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
          errModel:
              ErrorModel(errorMessage: _defaultErrorMessage, statusCode: 400));
    }
  }

  @override
  Future<List<OrderModel>> getAllPendingRequestsToTechnical() =>
      _fetchOrderList(EndPoint.getAllPendingRequestsToTechnical);

  @override
  Future<List<OrderModel>> getAllOrders() =>
      _fetchOrderList(EndPoint.getAllOrders);

  @override
  Future<List<OrderModel>> getAllOrdersCancal() =>
      _fetchOrderList(EndPoint.getAllOrdersCancal);

  @override
  Future<List<OrderModel>> getAllOrdersComplate() =>
      _fetchOrderList(EndPoint.getAllOrdersComplate);

  @override
  Future<List<OrderModel>> getOrderInProgress() =>
      _fetchOrderList(EndPoint.getAllOrdersInprojrass);

  @override
  Future<TecnicalStateModel> setTecnicalActiveState() =>
      _processStateChange(EndPoint.techincalBeActive);

  @override
  Future<TecnicalStateModel> setTecnicalInctiveState() =>
      _processStateChange(EndPoint.techincalBeInActive);

  @override
  Future<TecnicalStateModel> acceptOrderState({required int id}) =>
      _processStateChange('${EndPoint.acceptRequest}$id');

  @override
  Future<TecnicalStateModel> cancelOrderState({required int id}) =>
      _processStateChange('${EndPoint.rejectRequest}$id');

  @override
  Future<TecnicalStateModel> completeOrderState({required int id}) =>
      _processStateChange('${EndPoint.completeRequest}$id');
}


import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/feature/technical/technical_home/data/datasource/order_remote_data_source.dart';
import 'package:splash_app/feature/technical/technical_home/data/model/order_model.dart';
import 'package:splash_app/feature/technical/technical_home/data/model/tecnical_state_model.dart';
import 'package:splash_app/feature/technical/technical_home/domain/entity/order_entity.dart';
import 'package:splash_app/feature/technical/technical_home/domain/entity/tecnical_state.dart';
import 'package:splash_app/feature/technical/technical_home/domain/repo/order_repo.dart';

class OrderRepoImplementation implements OrderRepo {
  final BaseOrderRemoteDataSource _remoteDataSource;
  static const _defaultErrorMessage = 'An unexpected error occurred';

  OrderRepoImplementation({required BaseOrderRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  Future<Either<ErrorModel, List<OrderEntity>>> _fetchOrderList(
    Future<List<OrderModel>> Function() fetchFunction,
  ) async {
    try {
      final orders = await fetchFunction();
      return right(orders);
    } on ServerException catch (e) {
      return left(_mapExceptionToError(e));
    } catch (e) {
      return left(ErrorModel(
        statusCode: 500,
        errorMessage: _defaultErrorMessage,
      ));
    }
  }

  Future<Either<ErrorModel, TecnicalStateEntity>> _processStateChange(
    Future<TecnicalStateModel> Function() changeFunction,
  ) async {
    try {
      final state = await changeFunction();
      return right(state);
    } on ServerException catch (e) {
      return left(_mapExceptionToError(e));
    } catch (e) {
      return left(ErrorModel(
        statusCode: 500,
        errorMessage: _defaultErrorMessage,
      ));
    }
  }

  ErrorModel _mapExceptionToError(ServerException exception) {
    return ErrorModel(
      statusCode: exception.errModel.statusCode,
      errorMessage: exception.errModel.errorMessage,
    );
  }

  @override
  Future<Either<ErrorModel, List<OrderEntity>>> getAllRequestPanding() =>
      _fetchOrderList(_remoteDataSource.getAllPendingRequestsToTechnical);

  @override
  Future<Either<ErrorModel, List<OrderEntity>>> getAllOrders() =>
      _fetchOrderList(_remoteDataSource.getAllOrders);

  @override
  Future<Either<ErrorModel, List<OrderEntity>>> getComplateOrder() =>
      _fetchOrderList(_remoteDataSource.getAllOrdersComplate);

  @override
  Future<Either<ErrorModel, List<OrderEntity>>> getOrderInProgress() =>
      _fetchOrderList(_remoteDataSource.getOrderInProgress);

  @override
  Future<Either<ErrorModel, List<OrderEntity>>> getAllOrdersCancal() =>
      _fetchOrderList(_remoteDataSource.getAllOrdersCancal);

  @override
  Future<Either<ErrorModel, TecnicalStateEntity>> setTechnicalActive() =>
      _processStateChange(_remoteDataSource.setTecnicalActiveState);

  @override
  Future<Either<ErrorModel, TecnicalStateEntity>> setTechnicalInctive() =>
      _processStateChange(_remoteDataSource.setTecnicalInctiveState);

  @override
  Future<Either<ErrorModel, TecnicalStateEntity>> acceptOrder({required int id}) =>
      _processStateChange(() => _remoteDataSource.acceptOrderState(id: id));

  @override
  Future<Either<ErrorModel, TecnicalStateEntity>> cancelOrder({required int id}) =>
      _processStateChange(() => _remoteDataSource.cancelOrderState(id: id));

  @override
  Future<Either<ErrorModel, TecnicalStateEntity>> complateOrder({required int id}) =>
      _processStateChange(() => _remoteDataSource.completeOrderState(id: id));
}
import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/technical/technical_home/data/datasource/order_remote_data_source.dart';
import 'package:splash_app/technical/technical_home/data/model/order_model.dart';
import 'package:splash_app/technical/technical_home/data/model/tecnical_state_model.dart';
import 'package:splash_app/technical/technical_home/domain/entity/order_entity.dart';
import 'package:splash_app/technical/technical_home/domain/entity/tecnical_state.dart';
import 'package:splash_app/technical/technical_home/domain/repo/order_repo.dart';

class OrderRepoImplemntation extends OrderRepo {
  BaseOrderRemoteDataSource baseOrderRemoteDataSource;
  OrderRepoImplemntation({required this.baseOrderRemoteDataSource});

  @override
  Future<Either<ErrorModel, List<OrderEntity>>> getAllRequestPanding() async {
    try {
      List<OrderModel> orderModel =
          await baseOrderRemoteDataSource.getAllPendingRequestsToTechnical();

      return right(orderModel);
    } on ServerException catch (e) {
      return left(ErrorModel(
          statusCode: e.errModel.statusCode,
          errorMessage: e.errModel.errorMessage));
    }
  }
  @override
  Future<Either<ErrorModel, List<OrderEntity>>> getAllOrders() async {
    try {
      List<OrderModel> orderModel =
          await baseOrderRemoteDataSource.getAllOrders();

      return right(orderModel);
    } on ServerException catch (e) {
      return left(ErrorModel(
          statusCode: e.errModel.statusCode,
          errorMessage: e.errModel.errorMessage));
    }
  }
  @override
  Future<Either<ErrorModel, List<OrderEntity>>> getComplateOrder() async {
    try {
      List<OrderModel> orderModel =
          await baseOrderRemoteDataSource.getComplateOrder();

      return right(orderModel);
    } on ServerException catch (e) {
      return left(ErrorModel(
          statusCode: e.errModel.statusCode,
          errorMessage: e.errModel.errorMessage));
    }
  }

  @override
  Future<Either<ErrorModel, TecnicalStateEntity>> setTechnicalActive() async {
    try {
      TecnicalStateModel tecnicalStateModel =
          await baseOrderRemoteDataSource.setTecnicalActiveState();

      return right(tecnicalStateModel);
    } on ServerException catch (e) {
      return left(ErrorModel(
          statusCode: e.errModel.statusCode,
          errorMessage: e.errModel.errorMessage));
    }
  }
  @override
  Future<Either<ErrorModel, TecnicalStateEntity>> setTechnicalInctive() async {
    try {
      TecnicalStateModel tecnicalStateModel =
          await baseOrderRemoteDataSource.setTecnicalInctiveState();

      return right(tecnicalStateModel);
    } on ServerException catch (e) {
      return left(ErrorModel(
          statusCode: e.errModel.statusCode,
          errorMessage: e.errModel.errorMessage));
    }
  }
  
  @override
  Future<Either<ErrorModel, TecnicalStateEntity>> acceptOrder({required int id}) async{
   try {
      TecnicalStateModel tecnicalStateModel =
          await baseOrderRemoteDataSource.accpetOrderState(id: id);

      return right(tecnicalStateModel);
    } on ServerException catch (e) {
      return left(ErrorModel(
          statusCode: e.errModel.statusCode,
          errorMessage: e.errModel.errorMessage));
    }
  }
  
  @override
  Future<Either<ErrorModel, TecnicalStateEntity>> cancelOrder(
      {required int id}
  ) async{
      try {
      TecnicalStateModel tecnicalStateModel =
          await baseOrderRemoteDataSource.cancelOrderState(id: id);

      return right(tecnicalStateModel);
    } on ServerException catch (e) {
      return left(ErrorModel(
          statusCode: e.errModel.statusCode,
          errorMessage: e.errModel.errorMessage));
    }
  }
  @override
  Future<Either<ErrorModel, TecnicalStateEntity>> complateOrder(
      {required int id}
  ) async{
      try {
      TecnicalStateModel tecnicalStateModel =
          await baseOrderRemoteDataSource.complateOrderState(id: id);

      return right(tecnicalStateModel);
    } on ServerException catch (e) {
      return left(ErrorModel(
          statusCode: e.errModel.statusCode,
          errorMessage: e.errModel.errorMessage));
    }
  }
}

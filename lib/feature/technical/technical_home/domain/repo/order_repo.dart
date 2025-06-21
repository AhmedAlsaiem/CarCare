import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/technical/technical_home/domain/entity/order_entity.dart';
import 'package:splash_app/feature/technical/technical_home/domain/entity/tecnical_state.dart';

abstract class OrderRepo {
 
  Future<Either<ErrorModel,List<OrderEntity> >> getAllRequestPanding();
  Future<Either<ErrorModel,List<OrderEntity> >> getAllOrders();
  Future<Either<ErrorModel,List<OrderEntity> >> getComplateOrder();
  Future<Either<ErrorModel,List<OrderEntity> >> getAllOrdersCancal();
  Future<Either<ErrorModel,List<OrderEntity> >> getOrderInProgress();


  Future<Either<ErrorModel,TecnicalStateEntity >> setTechnicalActive();
  Future<Either<ErrorModel,TecnicalStateEntity >> setTechnicalInctive();
  Future<Either<ErrorModel,TecnicalStateEntity >> acceptOrder({required int id});
  Future<Either<ErrorModel,TecnicalStateEntity >> cancelOrder({required int id});
  Future<Either<ErrorModel,TecnicalStateEntity >> complateOrder({required int id});





}

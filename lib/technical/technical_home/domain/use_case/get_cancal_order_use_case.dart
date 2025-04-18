import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/technical/technical_home/domain/entity/order_entity.dart';
import 'package:splash_app/technical/technical_home/domain/repo/order_repo.dart';

class GetCancalOrderUseCase {
  OrderRepo orderRepo;
  GetCancalOrderUseCase(this.orderRepo);
  Future<Either<ErrorModel,List< OrderEntity>>> excute() async {
    return await orderRepo.getAllOrdersCancal();
  }
}

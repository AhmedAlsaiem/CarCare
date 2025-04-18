import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/technical/technical_home/domain/entity/tecnical_state.dart';
import 'package:splash_app/technical/technical_home/domain/repo/order_repo.dart';

class AcceptOrderUseCase {
  OrderRepo orderRepo;
  AcceptOrderUseCase(this.orderRepo);
  Future<Either<ErrorModel, TecnicalStateEntity>> excute({required int id}) async {
    return await orderRepo.acceptOrder(id: id);
  }
}

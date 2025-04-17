import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/dio_api.dart';
import 'package:splash_app/technical/technical_home/data/datasource/order_remote_data_source.dart';
import 'package:splash_app/technical/technical_home/data/repo_implamentation/order_repo_implemntation.dart';
import 'package:splash_app/technical/technical_home/domain/repo/order_repo.dart';
import 'package:splash_app/technical/technical_home/domain/use_case/accept_order_use_case.dart';
import 'package:splash_app/technical/technical_home/domain/use_case/cancal_order_use_case.dart';
import 'package:splash_app/technical/technical_home/domain/use_case/complate_order_use_case.dart';
import 'package:splash_app/technical/technical_home/domain/use_case/tecnical_use_case_active.dart';
import 'package:splash_app/technical/technical_home/domain/use_case/tecnical_use_case_inactive.dart';
import 'package:splash_app/technical/technical_home/presentation/manger/order_cubit/order_cubit.dart';
import 'package:splash_app/technical/technical_home/presentation/manger/tecnical_state/tecnical_state.dart';

class TecniaclCubit extends Cubit<TecnicalState> {
  TecniaclCubit() : super(TecnicalState());

  void setTecnicalActive() async {
    OrderRepo orderRepo = triggerRepoOrder();
    emit(IsLoadingTecnicalState());

    await GettecnicalUseCaseActive(orderRepo).excute().then((result) {
      result.fold(
        (errorModel) {
          emit(FaliureTecnicalState(errorMessage: errorModel.errorMessage));
        },
        (tecnicalmodel) {
          emit(SuccessTecnicalState(tecnicalmodel, successMessage: 'Success'));
        },
      );
    });
  }

  void setTecnicalInActive() async {
    OrderRepo orderRepo = triggerRepoOrder();
    emit(IsLoadingTecnicalState());

    await GettecnicalUseCaseInactive(orderRepo).excute().then((result) {
      result.fold(
        (errorModel) {
          emit(FaliureTecnicalState(errorMessage: errorModel.errorMessage));
        },
        (tecnicalmodel) {
          emit(SuccessTecnicalState(tecnicalmodel, successMessage: 'Success'));
        },
      );
    });
  }

  void acceptOrder(
      {required int orderId,
      required BuildContext context,
      required VoidCallback onOrderAccepted}) async {
    OrderRepo orderRepo = triggerRepoOrder();
    emit(IsLoadingTecnicalState());

    await AcceptOrderUseCase(orderRepo).excute(id: orderId).then((result) {
      result.fold(
        (errorModel) {
          emit(FaliureTecnicalState(errorMessage: errorModel.errorMessage));
        },
        (tecnicalmodel) {
          emit(SuccessTecnicalState(tecnicalmodel, successMessage: 'Success'));
          BlocProvider.of<OrderCubit>(context).getAllrequestPinding();
          onOrderAccepted();
        },
      );
    });
  }

  void cancalOrder(
      {required int orderId,
      required BuildContext context,
      required VoidCallback onOrderCancled}) async {
    OrderRepo orderRepo = triggerRepoOrder();
    emit(IsLoadingTecnicalState());

    await CancalOrderUseCase(orderRepo).excute(id: orderId).then((result) {
      result.fold(
        (errorModel) {
          emit(FaliureTecnicalState(errorMessage: errorModel.errorMessage));
        },
        (tecnicalmodel) {
          emit(SuccessTecnicalState(tecnicalmodel, successMessage: 'Success'));
          BlocProvider.of<OrderCubit>(context).getAllrequestPinding();
          onOrderCancled();
        },
      );
    });
  }

  void complateOrder(
      {required int orderId, required BuildContext context}) async {
    OrderRepo orderRepo = triggerRepoOrder();
    emit(IsLoadingTecnicalState());

    await ComplateOrderUseCase(orderRepo).excute(id: orderId).then((result) {
      result.fold(
        (errorModel) {
          emit(FaliureTecnicalState(errorMessage: errorModel.errorMessage));
        },
        (tecnicalmodel) {
          emit(SuccessTecnicalState(tecnicalmodel, successMessage: 'Success'));
          BlocProvider.of<OrderCubit>(context).getOrderInProgress();
        },
      );
    });
  }

  OrderRepo triggerRepoOrder() {
    ApiConsumer api = DioConsumer(dio: Dio());
    OrderRemoteDataSource oderRemoteDataSourse = OrderRemoteDataSource(api);

    OrderRepo orderRepo =
        OrderRepoImplementation(remoteDataSource: oderRemoteDataSourse);

    return orderRepo;
  }
}

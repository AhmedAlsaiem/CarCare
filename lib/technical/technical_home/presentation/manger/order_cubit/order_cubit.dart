import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/dio_api.dart';
import 'package:splash_app/technical/technical_home/data/datasource/order_remote_data_source.dart';
import 'package:splash_app/technical/technical_home/data/repo_implamentation/order_repo_implemntation.dart';
import 'package:splash_app/technical/technical_home/domain/entity/order_entity.dart';
import 'package:splash_app/technical/technical_home/domain/repo/order_repo.dart';
import 'package:splash_app/technical/technical_home/domain/use_case/get_all_orders.dart';
import 'package:splash_app/technical/technical_home/domain/use_case/get_all_request_panding_use_case.dart';
import 'package:splash_app/technical/technical_home/domain/use_case/get_complate_order_use_case.dart';
import 'package:splash_app/technical/technical_home/presentation/manger/order_cubit/order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderState());

  //static const int _perPage =10; // Items per page
  List<OrderEntity> _allOrders = []; // Stores all loaded orders

  List<OrderEntity> displayedOrders = []; // الطلبات المعروضة حالياً

  int _currentPage = 0;
  final int _pageSize = 7;
  void filterOrders(String filter) {
    if (state is! SuccessOrderState) return;

    final currentState = state as SuccessOrderState;
    emit(SuccessOrderState(
      currentState.orders,
      isLoadingMore: currentState.isLoadingMore,
    ));
  }

  Future<List<OrderEntity>> getAllrequestPinding() async {
    OrderRepo orderRepo = triggerRepoOrder(); //
    emit(IsLoadingOrderState());

    dynamic response = await GetAllRequestPandingUseCase(orderRepo).excute();

    return response.fold(
      (errorModel) {
        emit(FaliureOrderState(errorMessage: errorModel.errorMessage));
        return <OrderEntity>[];
        // return []; // Return an empty list to ensure a valid return type
      },
      (orderList) {
        emit(SuccessOrderState(orderList, successMessage: 'Success'));
        return orderList; // Return the fetched orders
      },
    );
  }

  Future<void> loadOrders() async {
    emit(IsLoadingOrderState());
    OrderRepo orderRepo = triggerRepoOrder();

    var response = await GetAllOrdersUseCase(orderRepo).excute();
    response.fold(
      (errorModel) {
        emit(FaliureOrderState(errorMessage: errorModel.errorMessage));
      },
      (orderList) {
        _allOrders = orderList;
        displayedOrders = _allOrders.take(_pageSize).toList();
        _currentPage = 1;
        emit(SuccessOrderState(displayedOrders, successMessage: 'Success'));
      },
    );
  }

  void loadMoreOrders() {
    // Don't load more if we're already loading or have no more items
    if (state.isLoadingMore || _currentPage * _pageSize >= _allOrders.length) {
      return;
    }

    // Emit loading state
    emit(SuccessOrderState(
      displayedOrders,
      isLoadingMore: true,
    ));

    // Simulate network delay (remove in production)
    Future.delayed(const Duration(seconds: 1), () {
      try {
        int startIndex = _currentPage * _pageSize;
        int endIndex = startIndex + _pageSize;

        // Ensure we don't go out of bounds
        if (startIndex >= _allOrders.length) return;
        if (endIndex > _allOrders.length) {
          endIndex = _allOrders.length;
        }

        // Add new items
        final newOrders = _allOrders.sublist(startIndex, endIndex);
        displayedOrders.addAll(newOrders);
        _currentPage++;

        emit(SuccessOrderState(
          List.from(displayedOrders),
          isLoadingMore: false,
          successMessage: 'Loaded ${newOrders.length} more orders',
        ));
      } catch (e) {
        emit(FaliureOrderState(errorMessage: 'Failed to load more orders'));
      }
    });
  }

  Future<List<OrderEntity>> getComplateOrder() async {
    OrderRepo orderRepo = triggerRepoOrder(); //
    emit(IsLoadingOrderState());

    dynamic response = await GetComplateOrderUseCase(orderRepo).excute();

    return response.fold(
      (errorModel) {
        emit(FaliureOrderState(errorMessage: errorModel.errorMessage));
        return <OrderEntity>[];
        //return []; // Return an empty list to ensure a valid return type
      },
      (orderList) {
        emit(SuccessOrderState(orderList, successMessage: 'Success'));
        return orderList; // Return the fetched orders
      },
    );
  }

  OrderRepo triggerRepoOrder() {
    ApiConsumer api = DioConsumer(dio: Dio());
    OderRemoteDataSourse oderRemoteDataSourse = OderRemoteDataSourse(api);
    return OrderRepoImplemntation(
        baseOrderRemoteDataSource: oderRemoteDataSourse);
  }
}

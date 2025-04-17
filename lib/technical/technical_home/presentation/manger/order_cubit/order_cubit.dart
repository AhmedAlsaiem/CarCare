import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/dio_api.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/technical/technical_home/data/datasource/order_remote_data_source.dart';
import 'package:splash_app/technical/technical_home/data/repo_implamentation/order_repo_implemntation.dart';
import 'package:splash_app/technical/technical_home/domain/entity/order_entity.dart';
import 'package:splash_app/technical/technical_home/domain/repo/order_repo.dart';
import 'package:splash_app/technical/technical_home/domain/use_case/get_all_orders.dart';
import 'package:splash_app/technical/technical_home/domain/use_case/get_all_request_panding_use_case.dart';
import 'package:splash_app/technical/technical_home/domain/use_case/get_cancal_order_use_case.dart';
import 'package:splash_app/technical/technical_home/domain/use_case/get_complate_order_use_case.dart';
import 'package:splash_app/technical/technical_home/domain/use_case/get_inprograss_order_use_case.dart';
import 'package:splash_app/technical/technical_home/presentation/manger/order_cubit/order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  // Add disposal flag
  bool _isDisposed = false;
  String? _lastError;
  // Cache repositories and data sources
  late final ApiConsumer _api;
  late final OrderRemoteDataSource _remoteDataSource;
  late final OrderRepo _orderRepo;
  Timer? _debounceTimer;

  // Pagination
  final int _pageSize = 7;
  int _currentPage = 0;
  List<OrderEntity> _allOrders = [];
  List<OrderEntity> displayedOrders = [];

  OrderCubit() : super(OrderState()) {
    _api = DioConsumer(dio: Dio());
    _remoteDataSource = OrderRemoteDataSource(_api);
    _orderRepo = OrderRepoImplementation(
      remoteDataSource: _remoteDataSource,
    );
  }

  // Safe emit method
  @override
  void emit(OrderState state) {
    if (!_isDisposed) {
      super.emit(state);
    }
  }

  @override
  Future<void> close() {
    _isDisposed = true;
    _debounceTimer?.cancel();
    _allOrders.clear();
    displayedOrders.clear();
    return super.close();
  }
// Track last shown error

  Future<void> _safeApiCall(
    Future<Either<ErrorModel, List<OrderEntity>>> Function() apiCall,
  ) async {
    if (_isDisposed) return;

    emit(IsLoadingOrderState());

    try {
      final response = await apiCall();
      if (_isDisposed) return;

      response.fold(
        (error) {
          //  Only emit if error is different from last one;
          if (_lastError != error.errorMessage) {
            _lastError = error.errorMessage;
            emit(FaliureOrderState(errorMessage: error.errorMessage));
          }
          //   _lastError = error.errorMessage;
          // emit(FaliureOrderState(errorMessage: error.errorMessage));
        },
        (orders) {
          _lastError = null; // Reset error on success
          _allOrders = orders;
          displayedOrders = _allOrders.take(_pageSize).toList();
          _currentPage = 1;
          emit(SuccessOrderState(displayedOrders, successMessage: 'Success'));
        },
      );
    } catch (e) {
      final errorMsg = 'Unexpected error: ${e.toString()}';
      if (!_isDisposed && _lastError != errorMsg) {
        _lastError = errorMsg;
        emit(FaliureOrderState(errorMessage: errorMsg));
      }
    }
  }

  Future<void> loadOrders() =>
      _safeApiCall(() => GetAllOrdersUseCase(_orderRepo).excute());

  Future<void> getComplateOrder() =>
      _safeApiCall(() => GetComplateOrderUseCase(_orderRepo).excute());

  Future<void> getAllOrdersCancal() =>
      _safeApiCall(() => GetCancalOrderUseCase(_orderRepo).excute());

  Future<void> getOrderInProgress() =>
      _safeApiCall(() => GetInprograssOrderUseCase(_orderRepo).excute());

  Future<void> getAllrequestPinding() =>
      _safeApiCall(() => GetAllRequestPandingUseCase(_orderRepo).excute());

  void debouncedLoadOrders() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 300), loadOrders);
  }

  void loadMoreOrders() {
    if (_isDisposed ||
        state.isLoadingMore ||
        _currentPage * _pageSize >= _allOrders.length) {
      return;
    }

    emit(SuccessOrderState(
      displayedOrders,
      isLoadingMore: true,
    ));

    Future.delayed(const Duration(seconds: 1), () {
      if (_isDisposed) return;

      try {
        final startIndex = _currentPage * _pageSize;
        var endIndex = startIndex + _pageSize;
        endIndex = endIndex > _allOrders.length ? _allOrders.length : endIndex;

        final newOrders = _allOrders.sublist(startIndex, endIndex);
        displayedOrders = List.from(displayedOrders)..addAll(newOrders);
        _currentPage++;

        emit(SuccessOrderState(
          displayedOrders,
          isLoadingMore: false,
          successMessage: 'Loaded ${newOrders.length} orders',
        ));
      } catch (e) {
        if (!_isDisposed) {
          emit(FaliureOrderState(
            errorMessage: 'Load more failed: ${e.toString()}',
          ));
        }
      }
    });
  }
}

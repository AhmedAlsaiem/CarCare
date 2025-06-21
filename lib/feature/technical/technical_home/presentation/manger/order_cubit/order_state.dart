import 'package:splash_app/feature/technical/technical_home/domain/entity/order_entity.dart';

class OrderState {
  final bool isLoadingMore;

  OrderState({this.isLoadingMore = false});
}

class IsLoadingOrderState extends OrderState {
  bool isfirstLoad;
  IsLoadingOrderState({this.isfirstLoad = false});
}

class SuccessOrderState extends OrderState {
  final List<OrderEntity> orders; // Store list of orders
  final String? successMessage;

  SuccessOrderState(this.orders,
      {this.successMessage, bool isLoadingMore = false})
      : super(isLoadingMore: isLoadingMore);
}

class FaliureOrderState extends OrderState {
  final String errorMessage;

  FaliureOrderState({required this.errorMessage});
}

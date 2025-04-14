import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/feature/authentaction/presentation/view/custom_show_snack_bar.dart';
import 'package:splash_app/technical/technical_home/domain/entity/order_entity.dart';
import 'package:splash_app/technical/technical_home/presentation/manger/order_cubit/order_cubit.dart';
import 'package:splash_app/technical/technical_home/presentation/manger/order_cubit/order_state.dart';
import 'package:splash_app/technical/technical_home/presentation/widget/orders_in_all_orders.dart';
import 'package:splash_app/technical/technical_home/presentation/widget/shamer_loading.dart';

class OrderListInAllOrders extends StatelessWidget {
 final List<OrderEntity> Function(List<OrderEntity>) applyFilter;
//final List<OrderEntity> applyFilter;

  const OrderListInAllOrders({super.key, required this.applyFilter});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state is FaliureOrderState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            customShowSnackBar(context, state.errorMessage);
          });
        }
      },
      child: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state is IsLoadingOrderState) {
            return const ShimmerLoading();
          } else if (state is SuccessOrderState) {
           List<OrderEntity> orders = applyFilter(state.orders);

            if (orders.isEmpty) {
              return const Center(child: Text('No orders available.'));
            }
            return OrdersInAllOrders(orders: orders);
          } else if (state is FaliureOrderState) {
            return const Center(child: Text('Error loading data.'));
          } else {
            return const Center(child: Text('Waiting for  data...'));
          }
        },
      ),


    );
  }
}

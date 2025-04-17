import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/feature/authentaction/presentation/view/custom_show_snack_bar.dart';
import 'package:splash_app/technical/technical_home/domain/entity/order_entity.dart';
import 'package:splash_app/technical/technical_home/presentation/manger/order_cubit/order_cubit.dart';
import 'package:splash_app/technical/technical_home/presentation/manger/order_cubit/order_state.dart';
import 'package:splash_app/technical/technical_home/presentation/widget/order.dart';
import 'package:splash_app/technical/technical_home/presentation/widget/shamer_loading.dart';

class OrderList extends StatefulWidget {
  final List<OrderEntity> Function(List<OrderEntity>) applyFilter;

  const OrderList({super.key, required this.applyFilter});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  bool _mounted = true;

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderCubit, OrderState>(
      listenWhen: (previous, current) {
    // Only show error if it's new and not loading
    return current is FaliureOrderState && 
           previous is! FaliureOrderState &&
           previous is! IsLoadingOrderState;
  },
      listener: (context, state) {
         if (!_mounted) return;
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
            List<OrderEntity> orders = widget.applyFilter( state.orders);

            if (orders.isEmpty) {
              return const Center(child: Text('No orders available.'));
            }
            return Orders(orders: orders);
          } else if (state is FaliureOrderState) {
            return const Center(child: Text('No date.'));
          } else {
            return const Center(child: Text('Waiting for  data...'));
          }
        },
      ),
    );
  }
}
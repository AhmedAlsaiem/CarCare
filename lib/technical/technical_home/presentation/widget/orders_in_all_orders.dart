import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/technical/technical_home/domain/entity/order_entity.dart';
import 'package:splash_app/technical/technical_home/presentation/manger/order_cubit/order_cubit.dart';
import 'package:splash_app/technical/technical_home/presentation/manger/order_cubit/order_state.dart';
import 'package:splash_app/technical/technical_home/presentation/widget/order_details_in_all_orders.dart';

class OrdersInAllOrders extends StatefulWidget {
  const OrdersInAllOrders({super.key, required this.orders});

  final List<OrderEntity> orders;

  @override
  State<OrdersInAllOrders> createState() => _OrdersInAllOrdersState();
}

class _OrdersInAllOrdersState extends State<OrdersInAllOrders> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 30) {
        // Trigger load more when near the end of the list
        context.read<OrderCubit>().loadMoreOrders();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        List<OrderEntity> orders =
            widget.orders; // Use the passed filtered list
        bool isLoadingMore = false;

        if (state is SuccessOrderState) {
          isLoadingMore = state.isLoadingMore;
        }

        return ListView.builder(
          controller: _scrollController,
          itemCount: orders.length + (isLoadingMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == orders.length) {
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child:
                      CircularProgressIndicator(color: ColorsManager.mainColor),
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(AppSize.s16),
              child: Container(
                height: 128,
                width: context.screenWidth,
                decoration: BoxDecoration(
                  color: ColorsManager.white,
                  borderRadius: BorderRadius.circular(AppSize.s12),
                ),
                child: OrderDetailsInAllOrders(
                  name: orders[index].userName,
                  date: orders[index].createdOn,
                  distance: orders[index].distance,
                  price: orders[index].servicePrice,
                  bussinsState: orders[index].busnissStatus,
                  batteryType: orders[index].bettaryType,
                  tiresize: orders[index].tireSize,
                  typeOfFuel: orders[index].typeOfFuel,
                  typeOfoil: orders[index].typeOfOil,
                  winchType: orders[index].typeOfWinch,
                  id: orders[index].id,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/feature/technical/technical_home/domain/entity/order_entity.dart';
import 'package:splash_app/feature/technical/technical_home/presentation/manger/order_cubit/order_cubit.dart';
import 'package:splash_app/feature/technical/technical_home/presentation/widget/filter_drop_down.dart';
import 'package:splash_app/feature/technical/technical_home/presentation/widget/order_list_in_InPrograss_order.dart';

class InprogressOrderViewBody extends StatefulWidget {
  const InprogressOrderViewBody({super.key});

  @override
  // ignore: library_private_types_in_public_api
  InprogressOrderViewBodyState createState() => InprogressOrderViewBodyState();
}

class InprogressOrderViewBodyState extends State<InprogressOrderViewBody> {
  String _selectedFilter = "Filter";
  List<String> filterOptions = ["Filter", "Distance", "Oldest"];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<OrderCubit>(context).getOrderInProgress();
  }

  List<OrderEntity> _applyFilter(List<OrderEntity> orders) {
    List<OrderEntity> sortedOrders = List.from(orders);

    if (_selectedFilter == "Distance") {
      sortedOrders.sort((a, b) => a.distance.compareTo(b.distance));
    } else if (_selectedFilter == "Oldest") {
      sortedOrders.sort((a, b) => a.createdOn.compareTo(b.createdOn));
    }
    return sortedOrders;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              height: 70,
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                elevation: .5,
                color: Colors.grey[50],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilterDropdown(
                      selectedFilter: _selectedFilter,
                      filterOptions: filterOptions,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedFilter = newValue;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              color: ColorsManager.mainColor,
              onRefresh: () async {
                await BlocProvider.of<OrderCubit>(context).getOrderInProgress();
              },
              child: OrderListInInprogressOrder(applyFilter: _applyFilter),
            ),
          ),

          //    Expanded(child: OrderListInComplateOrder(applyFilter: _applyFilter)),
        ],
      ),
    );
  }
}

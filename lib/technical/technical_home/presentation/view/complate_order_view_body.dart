import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/technical/technical_home/domain/entity/order_entity.dart';
import 'package:splash_app/technical/technical_home/presentation/manger/order_cubit/order_cubit.dart';
import 'package:splash_app/technical/technical_home/presentation/widget/filter_drop_down.dart';
import 'package:splash_app/technical/technical_home/presentation/widget/order_list_in_complate_order.dart';

class ComplateOrderViewBody extends StatefulWidget {
  const ComplateOrderViewBody({super.key});

  @override
  // ignore: library_private_types_in_public_api
 ComplateOrderViewBodyState createState() => ComplateOrderViewBodyState();
}

class ComplateOrderViewBodyState extends State<ComplateOrderViewBody> {
  String _selectedFilter = "Filter";
  List<String> filterOptions = ["Filter", "Distance", "Oldest"];

  @override



  void initState() {
    super.initState();
    BlocProvider.of<OrderCubit>(context).getComplateOrder();
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
         
         Expanded(child: OrderListInComplateOrder(applyFilter: _applyFilter)),
        ],
      ),
    );
  }
}

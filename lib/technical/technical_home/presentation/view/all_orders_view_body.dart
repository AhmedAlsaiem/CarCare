import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/technical/technical_home/domain/entity/order_entity.dart';
import 'package:splash_app/technical/technical_home/presentation/manger/order_cubit/order_cubit.dart';
import 'package:splash_app/technical/technical_home/presentation/widget/filter_drop_down.dart';
import 'package:splash_app/technical/technical_home/presentation/widget/order_list_in_all_orders.dart';

class AllOrdersViewBody extends StatefulWidget {
  const AllOrdersViewBody({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AllOrdersViewBodyState createState() => _AllOrdersViewBodyState();
}

class _AllOrdersViewBodyState extends State<AllOrdersViewBody> {

  String _statusFilter = "All"; // Add this as a class variable
List<String> statusOptions = ["All", "InProgress", "Pending", "Completed", "Canceled"];

List<OrderEntity> _applyFilter(List<OrderEntity> orders) {
  // Filter by status
  List<OrderEntity> filteredOrders = _statusFilter == "All"
      ? List.from(orders)
      : orders.where((order) => order.busnissStatus == _statusFilter).toList();

  // Apply sorting
  if (_statusFilter == "Distance") {
    filteredOrders.sort((a, b) => a.distance.compareTo(b.distance));
  } else if (_statusFilter == "Oldest") {
    filteredOrders.sort((a, b) => a.createdOn.compareTo(b.createdOn));
  }
  
  return filteredOrders;
}
  

  @override

  void initState() {
    super.initState();
    BlocProvider.of<OrderCubit>(context).loadOrders();
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
                      selectedFilter: _statusFilter,
                      filterOptions: statusOptions,
                      onChanged: (newValue) {
                        setState(() {
                          _statusFilter = newValue;
                        });
                      },
                    ),
     
                  ],
                ),
              ),
            ),
          ),
         
         Expanded(child: OrderListInAllOrders(applyFilter: _applyFilter)),
        ],
      ),
    );
  }
}


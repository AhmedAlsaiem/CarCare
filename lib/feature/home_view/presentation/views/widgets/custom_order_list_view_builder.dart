import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/filter_order_by_current_period.dart';
import 'package:splash_app/core/functions/handle_filter_types.dart';
import 'package:splash_app/feature/home_view/presentation/views/widgets/order_filter_item.dart';
import 'package:splash_app/feature/home_view/presentation/views/widgets/order_list_view_builder.dart';
import 'package:splash_app/feature/paid_services/domain/enties/service_request_entity.dart';

class CustomorderListViewBuilder extends StatefulWidget {
  const CustomorderListViewBuilder({
    super.key,
    required this.ordersList,
    required this.lastIndex,
  });
  final int lastIndex;
  final List<ServiceRequestEntity> ordersList;

  @override
  State<CustomorderListViewBuilder> createState() =>
      _CustomorderListViewBuilderState();
}

class _CustomorderListViewBuilderState
    extends State<CustomorderListViewBuilder> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomOrderFilterItems(
              index: 1,
              currentIndex: currentIndex,
              title: 'All',
              onTap: () {
                currentIndex = 1;
                setState(() {});
              },
            ),
            CustomOrderFilterItems(
              title: ' Day',
              index: 2,
              currentIndex: currentIndex,
              onTap: () {
                currentIndex = 2;
                setState(() {});
              },
            ),
            CustomOrderFilterItems(
              index: 3,
              title: ' Month',
              onTap: () {
                currentIndex = 3;
                setState(() {});
              },
              currentIndex: currentIndex,
            ),
            CustomOrderFilterItems(
              title: 'Year',
              index: 4,
              currentIndex: currentIndex,
              onTap: () {
                currentIndex = 4;
                setState(() {});
              },
            ),
          ],
        ),
        const SizedBox(height: 15),
        OrderListViewBuilder(
            ordersList: filterOrdersByCurrentPeriod(
                filterType: handleFilterTyps(index: currentIndex),
                orders: widget.ordersList)),
      ],
    );
  }
}
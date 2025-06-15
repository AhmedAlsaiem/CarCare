import 'package:flutter/material.dart';
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
              title: ' Week',
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

List<ServiceRequestEntity> filterOrdersByCurrentPeriod({
  required List<ServiceRequestEntity> orders,
  required String filterType,
}) {
  final now = DateTime.now();

  if (!['week', 'month', 'year'].contains(filterType.toLowerCase())) {
    return orders;
  }

  return orders.where((order) {
    final DateTime orderDate = DateTime.parse(order.createdOn);

    switch (filterType.toLowerCase()) {
      case '':
        final nowStartOfWeek = now.subtract(Duration(days: now.weekday - 1));
        print('week');
        final nowEndOfWeek = nowStartOfWeek.add(const Duration(days: 6));
        return orderDate
                .isAfter(nowStartOfWeek.subtract(const Duration(seconds: 1))) &&
            orderDate.isBefore(nowEndOfWeek.add(const Duration(days: 1)));
      case 'month':

        return orderDate.year == now.year && orderDate.month == now.month;
      case 'year':

        return orderDate.year == now.year;
      default:
        return false;
    }
  }).toList();
}

String handleFilterTyps({required int index}) {
  switch (index) {
    case 1:
      return 'all';
    case 2:
      return 'week';
    case 3:
      return 'month';
    case 4:
      return 'year';

    default:
      return '';
  }
}

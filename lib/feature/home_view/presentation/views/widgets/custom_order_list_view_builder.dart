
import 'package:flutter/material.dart';
import 'package:splash_app/feature/home_view/presentation/views/widgets/custom_order_item.dart';
import 'package:splash_app/feature/paid_services/domain/enties/service_request_entity.dart';

class CustomorderListViewBuilder extends StatelessWidget {
  const CustomorderListViewBuilder({
    super.key,
    required this.ordersList,
  });

  final List<ServiceRequestEntity> ordersList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return CustomOrderItem(order: ordersList[index]);
      },
      itemCount: ordersList.length,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/feature/home_view/presentation/views/widgets/custom_order_item.dart';
import 'package:splash_app/feature/paid_services/domain/enties/service_request_entity.dart';

class OrderListViewBuilder extends StatelessWidget {
  const OrderListViewBuilder({
    super.key,
    required this.ordersList,
  });

  final List<ServiceRequestEntity> ordersList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.62,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return CustomOrderItem(order: ordersList[index]);
        },
        itemCount: ordersList.length,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/change_theme.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/feature/home_view/presentation/views/widgets/custom_order_status_widget.dart';
import 'package:splash_app/feature/paid_services/domain/enties/service_request_entity.dart';
import 'custom_order_item_info_widget.dart';

class CustomOrderItem extends StatelessWidget {
  const CustomOrderItem({
    super.key,
    required this.order,
  });
  final ServiceRequestEntity order;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSize.s12),
      child: Container(
        decoration: BoxDecoration(
          color: changeColor(status: order.busnissStatus),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSize.s12),
          ),
        ),
        height: 200,
        width: double.infinity,
        child: Column(
          children: [
            CustomOderIteminfoWidget(order: order),
            CustomOrderStatusWidget(order: order),
          ],
        ),
      ),
    );
  }
}

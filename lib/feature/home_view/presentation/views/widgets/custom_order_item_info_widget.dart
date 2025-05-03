import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/change_theme.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/home_view/presentation/views/widgets/custom_rate_button.dart';
import 'package:splash_app/feature/paid_services/domain/enties/service_request_entity.dart';

import 'custom_order_item_info_column.dart';

class CustomOderIteminfoWidget extends StatelessWidget {
  const CustomOderIteminfoWidget({
    super.key,
    required this.order,
  });

  final ServiceRequestEntity order;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        decoration: const BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(AppSize.s20),
            bottomRight: Radius.circular(AppSize.s20),
            topLeft: Radius.circular(AppSize.s12),
            topRight: Radius.circular(AppSize.s12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppSize.s16, horizontal: AppSize.s12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(child: SizedBox()),
              CircleAvatar(
                radius: AppSize.s32,
                backgroundColor: ColorsManager.white,
                backgroundImage: AssetImage(
                  changeImage(status: order.busnissStatus),
                ),
              ),
              const Expanded(child: SizedBox()),
              CustomOrderItemInfoColumn(order: order),
              const Expanded(
                flex: 3,
                child: SizedBox(),
              ),
              order.busnissStatus == StringsManager.complated
                  ? const CustomRateButton()
                  : Container(),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}

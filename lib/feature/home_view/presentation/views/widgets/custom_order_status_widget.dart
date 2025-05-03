
import 'package:flutter/material.dart' ;
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart' show StringsManager;
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/paid_services/domain/enties/service_request_entity.dart';

class CustomOrderStatusWidget extends StatelessWidget {
  const CustomOrderStatusWidget({
    super.key,
    required this.order,
  });

  final ServiceRequestEntity order;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              StringsManager.orderStatus,
              style: StylesManager.textStyleMedium16.copyWith(
                color: ColorsManager.white,
              ),
            ),
            Text(
              order.busnissStatus,
              style: StylesManager.textStyleMedium16.copyWith(
                color: ColorsManager.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

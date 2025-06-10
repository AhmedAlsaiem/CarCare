import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/convet_time_from_string_to_date_function.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/paid_services/domain/enties/service_request_entity.dart';

class CustomOrderItemInfoColumn extends StatelessWidget {
  const CustomOrderItemInfoColumn({
    super.key,
    required this.order,
  });

  final ServiceRequestEntity order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: AppSize.s20),
        SizedBox(
          width: context.screenWidth * 0.5,
          child: Center(
            child: Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              order.techName,
              style: StylesManager.textStyleRegular17.copyWith(
                color: ColorsManager.balck,
              ),
            ),
          ),
        ),
        const SizedBox(height: 3),
        Text(
          order.bettaryYpe +
              order.typeOfFuel +
              order.typeOfOil +
              order.typeOfWinch +
              order.tireSize,
          style: StylesManager.textStyleRegular16grey.copyWith(
            color: ColorsManager.balck,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          parseCustomDateTime(order.createdOn),
          style: StylesManager.textStyleRegular16grey.copyWith(
            color: ColorsManager.balck,
          ),
        ),
      ],
    );
  }
}

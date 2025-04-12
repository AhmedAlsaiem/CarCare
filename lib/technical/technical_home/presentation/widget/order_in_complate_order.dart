import 'package:flutter/material.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/technical/technical_home/domain/entity/order_entity.dart';
import 'package:splash_app/technical/technical_home/presentation/widget/oreder_details_in_complate_order.dart';

class OrderInComplateOrder extends StatelessWidget {
  const OrderInComplateOrder({
    super.key,
    required this.orders,
  });

  final List<OrderEntity> orders;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    //  shrinkWrap: true,
      //      shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(AppSize.s16),
          child: Container(
            height: 180,
            width: context.screenWidth,
            decoration: BoxDecoration(
                color: ColorsManager.mainColor,
                borderRadius: BorderRadius.circular(AppSize.s12)),
                
            child: OrederDetailsInComplateOrder(
              name: orders[index].userName,
              date: orders[index].createdOn,
              distance: orders[index].distance,
              price: orders[index].servicePrice,
              bussinsState: orders[index].busnissStatus,
              batteryType: orders[index].bettaryType,
              tiresize:   orders[index].tireSize,
              typeOfFuel: orders[index].typeOfFuel,
              typeOfoil: orders[index].typeOfOil,
              winchType: orders[index].typeOfWinch,
              id: orders[index].id,
            ),
          ),
        );
      },
    );
  }
}

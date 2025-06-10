import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/feature/home_view/presentation/views/widgets/custom_order_list_view.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.mainColor,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: ColorsManager.brightGrey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.s30),
            topRight: Radius.circular(AppSize.s30),
          ),
        ),
        child: const CustomOrderListView(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/home_view/presentation/views/widgets/custom_order_item.dart';

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
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppSize.s30,
            left: AppSize.s16,
            right: AppSize.s16,
          ),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return CustomOrderItem(value: testList[index]);
            },
            itemCount: testList.length,
          ),
        ),
      ),
    );
  }
}

List<String> testList = [
  StringsManager.done,
  StringsManager.inProgress,
  StringsManager.pending,
  StringsManager.done,
  StringsManager.inProgress,
  StringsManager.pending,
  StringsManager.done,
  StringsManager.inProgress,
  StringsManager.pending,
  StringsManager.done,
  StringsManager.inProgress,
  StringsManager.pending,
];

import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/feature/my_car/presebtation/widgets/custom_car_list_view.dart';

class MycarViewBody extends StatelessWidget {
  const MycarViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.mainColor,
      child: Container(
        decoration: const BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: const CustomCarListView(),
      ),
    );
  }
}

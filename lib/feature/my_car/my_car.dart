import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/my_car/presebtation/view/my_car_view_body.dart';

import 'presebtation/widgets/custom_floation_action_botton.dart';
import 'presebtation/widgets/custom_my_car_app_bar.dart';

class MyCarsView extends StatelessWidget {
  const MyCarsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainColor,
      floatingActionButton: const CustomFloatinActionButton(),
      appBar: customMyCarAppBar(title: StringsManager.myCar),
      body: Container(
          decoration: const BoxDecoration(
            color: ColorsManager.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: const MycarViewBody()),
    );
  }
}

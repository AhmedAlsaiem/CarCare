import 'package:flutter/material.dart';
import 'package:splash_app/feature/my_car/presebtation/view/my_car_view_body.dart';

import 'presebtation/widgets/custom_floation_action_botton.dart';
import 'presebtation/widgets/custom_my_car_app_bar.dart';

class MyCarsView extends StatelessWidget {
  const MyCarsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:const CustomFloatinActionButton(),
      appBar: customMyCarAppBar(),
      body: const MycarViewBody(),
    );
  }


}

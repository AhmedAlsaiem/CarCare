import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart' show ColorsManager;
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/paid_services/presentation/view/widgets/batteries_car_view_body.dart';
import 'package:splash_app/feature/paid_services/presentation/view/widgets/custom_paid_service_app_bar.dart';

class BatteriesCarView extends StatelessWidget {
  const BatteriesCarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      appBar: customPaidServiceAppBar(title: StringsManager.batteriesType),
      body: BatteriesCarViewBody(),
    );
  }
}

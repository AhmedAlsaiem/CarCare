import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart' show ColorsManager;
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/paid_services/presentation/view/widgets/custom_paid_service_app_bar.dart';
import 'package:splash_app/feature/paid_services/presentation/view/widgets/fuel_car_view_body.dart';

class FuelCarView extends StatelessWidget {
  const FuelCarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(      backgroundColor: ColorsManager.white,

      appBar: customPaidServiceAppBar(title: StringsManager.fuelType),
      body: const FuelCarViewBody(),
    );
  }
}

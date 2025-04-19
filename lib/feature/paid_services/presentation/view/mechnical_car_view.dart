import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/paid_services/presentation/view/widgets/custom_paid_service_app_bar.dart';
import 'package:splash_app/feature/paid_services/presentation/view/widgets/mecanical_view_body.dart';

class MechnicalCarView extends StatelessWidget {
  const MechnicalCarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      appBar: customPaidServiceAppBar(title: StringsManager.winchtype),
      body: MecanicalViewBody(),
    );
  }
}

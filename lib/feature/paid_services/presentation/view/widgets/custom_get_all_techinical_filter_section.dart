

import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/app_size.dart' show AppSize;
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/feature/paid_services/presentation/view/widgets/cusotm_drop_down_button.dart';

class CustomGetAllTechinicalFilterSection extends StatelessWidget {
  const CustomGetAllTechinicalFilterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerRight,
        height: AppSize.s56,
        width: double.infinity,
        color: ColorsManager.mainColor,
        child: const CustomDropDownButton());
  }
}

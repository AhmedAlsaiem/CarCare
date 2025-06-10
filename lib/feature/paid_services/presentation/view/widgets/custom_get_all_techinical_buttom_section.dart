
import 'package:flutter/material.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/feature/paid_services/presentation/view/widgets/custom_techinical_list_view.dart';

class CustomGetAllTechinacalButtomSection extends StatelessWidget {
  const CustomGetAllTechinacalButtomSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.mainColor,
      child: Container(
        width: double.infinity,
        height: context.screenHeight * 0.789,
        decoration: const BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
        ),
        child: const CustomTechnicalItemListView(),
      ),
    );
  }
}
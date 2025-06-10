
import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/feature/home_view/presentation/views/widgets/app_bar_home.dart';
import 'package:splash_app/feature/home_view/presentation/views/widgets/choise_servicr_text_and_icon.dart';
import 'package:splash_app/feature/home_view/presentation/views/widgets/list_of_product_horizntal.dart';
import 'package:splash_app/feature/home_view/presentation/views/widgets/service_home_view.dart';

class CustomHomeViewBody extends StatelessWidget {
  const CustomHomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: ColorsManager.white,
        child: Column(
          children: [
            const HomeAppbar(),
            SizedBox(height: AppHeight.h6),
            const ProductOfHorizntalAndInductor(),
            SizedBox(height: AppHeight.h20),
            const ChoiseServiceTextAndIcon(),
            SizedBox(height: AppHeight.h8),
            const ServicesHomeView(),
          ],
        ),
      ),
    );
  }
}

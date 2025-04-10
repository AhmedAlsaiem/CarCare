import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/paid_services/presentation/view/widgets/mecanical_view_body.dart';

class MechnicalCarView extends StatelessWidget {
  const MechnicalCarView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorsManager.mainColor,
          title: Text(
            StringsManager.parkingType,
            style: StylesManager.textStyleBold24
                .copyWith(color: ColorsManager.balck),
          ),
          iconTheme: const IconThemeData(
              size: AppSize.s34, color: ColorsManager.balck),
        ),
        body: const MecanicalViewBody(),
      ),
    );
  }
}

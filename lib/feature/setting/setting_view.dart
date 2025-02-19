import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/setting/presentation/widgets/setting_view_body.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back_ios_new,
          size: AppSize.s30,
          color: ColorsManager.mainColor,
        ),
        backgroundColor: ColorsManager.white,
        title: Text(
          'Setting',
          style: StylesManager.textStyleBold22
              .copyWith(color: ColorsManager.mainColor),
        ),
        centerTitle: true,
      ),
      body: const SettingViewBody(),
    );
  }
}

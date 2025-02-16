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
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back,
          size: AppSize.s30,
        ),
        backgroundColor: ColorsManager.mainColor,
        title: Text(
          'Setting',
          style: StylesManager.textStyleBold22black,
        ),
        centerTitle: true,
      ),
      body: const SettingViewBody(),
    );
  }
}

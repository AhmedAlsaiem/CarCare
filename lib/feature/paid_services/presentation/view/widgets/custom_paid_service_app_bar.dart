
  import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

AppBar customPaidServiceAppBar({required String title}) {
    return AppBar(
      centerTitle: true,
      backgroundColor: ColorsManager.white,
      title: Text(
        title,
        style:
            StylesManager.textStyleBold24.copyWith(color: ColorsManager.balck),
      ),
      iconTheme:
          const IconThemeData(size: AppSize.s34, color: ColorsManager.balck),
    );
  }


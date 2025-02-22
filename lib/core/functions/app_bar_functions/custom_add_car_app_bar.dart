import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

AppBar customAddCarAppBar({required BuildContext context}) {
  return AppBar(
    elevation: 0,
    foregroundColor: ColorsManager.mainColor,
    surfaceTintColor: ColorsManager.white,
    backgroundColor: ColorsManager.lightGrey,
    title: Text(
      StringsManager.addACar,
      style: StylesManager.textStyleBold20black,
    ),
    leading: IconButton(
      onPressed: () {
        NavigatorManager.pushWithReplacement(
            context: context, route: AppRoutes.homeView);
      },
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: ColorsManager.balck,
      ),
    ),
  );
}

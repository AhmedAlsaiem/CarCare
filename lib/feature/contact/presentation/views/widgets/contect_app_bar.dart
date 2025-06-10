import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

AppBar contactAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: 80,
    surfaceTintColor: ColorsManager.mainColor,
    title: Text(
      'Contact',
      style:
          StylesManager.textStyleRegular22.copyWith(color: ColorsManager.white),
    ),
    backgroundColor: ColorsManager.mainColor,
    leading: IconButton(
      onPressed: () {
        NavigatorManager.pop(context: context);
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        color: ColorsManager.white,
      ),
    ),
  );
}

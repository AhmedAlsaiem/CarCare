import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

AppBar customMyCarAppBar({required String title}) {
  return AppBar(
    toolbarHeight: 130,
    leading: const Text(''),
    backgroundColor: ColorsManager.mainColor,
    title: Text(
      title,
      style: StylesManager.textStyleBold17.copyWith(color: ColorsManager.white),
    ),
    centerTitle: true,
  );
}

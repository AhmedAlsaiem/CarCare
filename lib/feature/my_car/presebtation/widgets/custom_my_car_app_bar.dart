import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

AppBar customMyCarAppBar({required String title }) {
  return AppBar(
    toolbarHeight: AppSize.s64,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
    leading: const Text(''),
    backgroundColor: const Color.fromARGB(255, 11, 66, 97),
    title: Text(
    title,
      style: StylesManager.textStyleBold22.copyWith(color: ColorsManager.white),
    ),
    centerTitle: true,
  );
}

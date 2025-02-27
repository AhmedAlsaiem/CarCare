import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

AppBar customMyCarAppBar() {
  return AppBar(
    toolbarHeight: AppSize.s100,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: ColorsManager.darkgreen,
        weight: 2,
      ),
      onPressed: () {},
    ),
    backgroundColor: const Color.fromARGB(255, 11, 66, 97),
    title: Text(
      'My Cars',
      style: StylesManager.textStyleBold22.copyWith(color: ColorsManager.white),
    ),
    centerTitle: true,
  );
}

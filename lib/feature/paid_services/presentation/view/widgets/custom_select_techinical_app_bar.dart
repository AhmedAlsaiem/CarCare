
import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

AppBar customSelectTechincalAppBar(BuildContext context) {
  return AppBar(
    title: Text(
      StringsManager.title,
      style: StylesManager.textStyleSemiBold20
          .copyWith(color: ColorsManager.white),
    ),
    leading: IconButton(
        onPressed: () {
          NavigatorManager.pop(context: context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: ColorsManager.white,
        )),
  );
}

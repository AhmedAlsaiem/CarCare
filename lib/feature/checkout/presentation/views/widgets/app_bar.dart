import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

AppBar buildAppBar({final String? title, required BuildContext context }) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: ColorsManager.mainColor),
      onPressed: () {
        NavigatorManager.pop(context: context);
      },
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Text(
      title ?? '',
      textAlign: TextAlign.center,
      style: StylesManager.style25,
    ),
  );
}

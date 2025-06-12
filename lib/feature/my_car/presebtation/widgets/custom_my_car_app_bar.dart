import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/navigation.dart';

import 'package:splash_app/core/utils/color_manager.dart';

AppBar customMyCarAppBar({required String title}) {
  return AppBar(
    toolbarHeight: 130,
    leading: const Text(''),
    backgroundColor: ColorsManager.mainColor,
    title: Text(
      title,
      style: const TextStyle(
        // Use direct style as test
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white, // Use direct color
      ),
    ),
    centerTitle: true,
  );
}

AppBar mapViewAppBar({required String title, required BuildContext context}) {
  return AppBar(
    toolbarHeight: 130,
    leading: IconButton(
        onPressed: () {
          NavigatorManager.pop(context: context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: ColorsManager.white,
        )),
    backgroundColor: ColorsManager.mainColor,
    title: Text(
      title,
      style: const TextStyle(
        // Use direct style as test
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white, // Use direct color
      ),
    ),
    centerTitle: true,
  );
}

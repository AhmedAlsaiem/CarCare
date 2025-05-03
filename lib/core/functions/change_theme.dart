import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/assets_manager.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';

String changeImage({required String status}) {
  if (status == StringsManager.complated) {
    return AssetsManager.userBatteries;
  } else if (status == StringsManager.inProgress) {
    return AssetsManager.userFuel;
  } else if (status == StringsManager.pending) {
    return AssetsManager.userWinch;
  } else {
    return AssetsManager.userBatteries;
  }
}

Color changeColor({required String status}) {
  if (status == StringsManager.complated) {
    return ColorsManager.mainColor;
  } else if (status == StringsManager.inProgress) {
    return ColorsManager.lightGoold;
  } else if (status == StringsManager.pending) {
    return ColorsManager.darkGrey;
  } else {
    return const Color.fromARGB(255, 47, 75, 54);
  }
}

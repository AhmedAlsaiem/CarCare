import 'package:flutter/services.dart';
import 'package:splash_app/core/utils/color_manager.dart';

void changeStatusBarColor() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: ColorsManager.white,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: ColorsManager.white,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
}

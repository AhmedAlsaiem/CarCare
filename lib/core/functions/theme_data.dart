import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';

ThemeData themData() {
  return ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor: ColorsManager.mainColor));
}

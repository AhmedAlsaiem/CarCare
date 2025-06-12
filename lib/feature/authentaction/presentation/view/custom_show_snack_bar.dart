import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

void customShowSnackBar(context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: ColorsManager.mainColor,
      content: Text(
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        message,
        style: StylesManager.textStyleRegular14.copyWith(
          color: ColorsManager.white,
        ),
      ),
    ),
  );
}

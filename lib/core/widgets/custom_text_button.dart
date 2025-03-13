import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';

import '../utils/app_size.dart';
import '../utils/styles_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.bottonName,
  });
  final String bottonName;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: const ButtonStyle(
          maximumSize:
              WidgetStatePropertyAll(Size(double.infinity, AppSize.s80)),
          // the background color of the button

          // the minimum size of the button
          minimumSize:
              WidgetStatePropertyAll(Size(double.infinity, AppSize.s68)),
          // the background color of the button
          backgroundColor: WidgetStatePropertyAll(ColorsManager.mainColor),
          // the shape of the button
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s12))))),
      // the text of the button
      child: Text(
        bottonName,
        // the style of the text
        style: StylesManager.textStyleRegular22,
      ),
    );
  }
/******  ea0e1d76-1651-42c3-90f6-97110a6aba9f  *******/
}

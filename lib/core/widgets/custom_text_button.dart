import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';

import '../utils/app_size.dart';
import '../utils/string_manager.dart';
import '../utils/styles_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: const ButtonStyle(
          minimumSize:
              WidgetStatePropertyAll(Size(double.infinity, AppSize.s70)),
          backgroundColor: WidgetStatePropertyAll(ColorsManager.mainColor),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s12))))),
      child: Text(
        StringsManager.login,
        style: StylesManager.textStyleBold24,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart' show StringsManager;
import 'package:splash_app/core/utils/styles_manager.dart';

class CustomRateButton extends StatelessWidget {
  const CustomRateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        backgroundColor: const WidgetStatePropertyAll(
          ColorsManager.mainColor,
        ),
      ),
      child: Text(
        StringsManager.rate,
        style: StylesManager.textStyleBold16,
      ),
    );
  }
}

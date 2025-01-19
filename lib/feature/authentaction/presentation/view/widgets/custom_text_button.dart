import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

import '../../../../../core/utils/color_manager.dart';

// ignore: must_be_immutable
class CustomTextBotton extends StatelessWidget {
  CustomTextBotton({
    super.key,
    required this.onPress,
    required this.title1,
    required this.title2,
  });
  final void Function()? onPress;
  String? title1;
  final String title2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          StringsManager.dontHaveAcount,
          style: StylesManager.textStyleRegular14.copyWith(
            color: ColorsManager.black,
          ),
        ),
        TextButton(
          style: const ButtonStyle(
              padding: WidgetStatePropertyAll(EdgeInsets.all(6))),
          onPressed: onPress,
          child: Text(
            StringsManager.signUp,
            style: StylesManager.textStyleBold17
                .copyWith(color: ColorsManager.mainColor),
          ),
        )
      ],
    );
  }
}

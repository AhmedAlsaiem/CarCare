import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

import '../../../../../core/utils/color_manager.dart';

// ignore: must_be_immutable
class CustomTextBotton extends StatelessWidget {
 const CustomTextBotton({
    super.key,
    required this.onPress,
  });
  final void Function()? onPress;

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

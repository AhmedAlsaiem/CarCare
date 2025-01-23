
import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class CustomForgetPasswordTrigrePage extends StatelessWidget {
  const CustomForgetPasswordTrigrePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
        StringsManager.remmberMy,
          style: StylesManager.textStyleRegular17
              .copyWith(color: ColorsManager.balck),
        ),
        TextButton(
          onPressed: () {
            NavigatorManager.pushName(
                context: context, route: AppRoutes.forGetPassword);
          },
          child: Text(
            StringsManager.forgetPassword,
            style: StylesManager.textStyleBold17
                .copyWith(color: ColorsManager.mainColor),
          ),
        ),
      ],
    );
  }
}

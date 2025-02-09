import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/app_size.dart';
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
        Padding(
          padding: const EdgeInsets.only(left: AppSize.s10),
          child: Text(
            StringsManager.remmberMe,
            style: StylesManager.textStyleBold17
                .copyWith(color: ColorsManager.balck.withValues(alpha: 90)),
          ),
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

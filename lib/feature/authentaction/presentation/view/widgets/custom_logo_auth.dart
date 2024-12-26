import 'package:flutter/material.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/assets_manager.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class CustomLogoAuth extends StatelessWidget {
  final String title;
  const CustomLogoAuth({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: ColorsManager.mainColor,
          borderRadius:
              BorderRadius.vertical(bottom: Radius.circular(AppSize.s28))),
      width: AppSize.infinty,
      height: context.screenHeight * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AssetsManager.logo,
          ),
          const SizedBox(height: AppSize.s14),
          Text(
            title,
            style: StylesManager.textStyleExtraBold32.copyWith(
              color: ColorsManager.white,
            ),
          )
        ],
      ),
    );
  }
}

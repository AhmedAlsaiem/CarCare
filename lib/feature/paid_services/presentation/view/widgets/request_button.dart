import 'package:flutter/material.dart';
import 'package:screenutil_module/main.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class RequesButton extends StatelessWidget {
  const RequesButton({
    required this.onTap,
    super.key,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: Appwidth.w24),
        height: AppHeight.h60,
        width: context.screenWidth,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(AppSize.s8.r),
          color: ColorsManager.mainColor,
        ),
        child: Center(
          child: Text(
            StringsManager.request,
            style: StylesManager.textStyleMedium20,
          ),
        ),
      ),
    );
  }
}

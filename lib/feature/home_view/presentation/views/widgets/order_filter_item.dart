import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class CustomOrderFilterItems extends StatelessWidget {
  const CustomOrderFilterItems({
    super.key,
    required this.title,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });
  final String title;
  final int index;
  final int currentIndex;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        curve: Curves.bounceIn,
        duration: const Duration(milliseconds: 100),
        margin: const EdgeInsets.only(right: AppSize.s8),
        decoration: BoxDecoration(
          color: index == currentIndex
              ? ColorsManager.blueGrey
              : ColorsManager.mainColor,
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        alignment: Alignment.center,
        height: AppSize.s56,
        width: AppSize.s80,
        child: Text(
          title,
          style: StylesManager.textStyleSemiBold18
              .copyWith(color: ColorsManager.white),
        ),
      ),
    );
  }
}

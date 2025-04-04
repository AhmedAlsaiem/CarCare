import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';

import 'custom_svg_button_navigation_bar_item.dart';

BottomBarItem customBottomBarItem({required String imagePath}) {
  return BottomBarItem(
    inActiveItem: Align(
      alignment: Alignment.center,
      child: CustomSvgButtonNavigationBarIcon(
        imagePath: imagePath,
        color: ColorsManager.white,
      ),
    ),
    activeItem: Align(
      alignment: Alignment.center,
      child: CustomSvgButtonNavigationBarIcon(
        imagePath: imagePath,
        color: ColorsManager.white,
      ),
    ),
  );
}

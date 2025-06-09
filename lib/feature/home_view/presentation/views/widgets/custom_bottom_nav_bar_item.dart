
import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';

import 'custom_svg_button_navigation_bar_item.dart';

BottomNavigationBarItem customBottomNavBarItem({
  required String activeIcon,
  required String inActiveIcon,
  required String title,
  required int index,
}) {
  return BottomNavigationBarItem(
    tooltip: '',
    backgroundColor: ColorsManager.white,
    label: title,
    activeIcon: CustomSvgButtonNavigationBarIcon(
        imagePath: activeIcon, color: ColorsManager.mainColor, size: 40),
    icon: CustomSvgButtonNavigationBarIcon(
        imagePath: inActiveIcon, color: ColorsManager.mainColor, size: 40),
  );
}

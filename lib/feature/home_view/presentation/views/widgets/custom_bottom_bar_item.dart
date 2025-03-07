import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'custom_svg_button_navigation_bar_item.dart';
BottomBarItem customBottomBarItem({required String imagePath}) {
    return BottomBarItem(
      inActiveItem: Align(
        alignment: Alignment.center,
        child: CustomSvgButtonNavigationBarIcon(imagePath: imagePath),
      ),
      activeItem: Align(
        alignment: Alignment.center,
        child: CustomSvgButtonNavigationBarIcon(imagePath: imagePath),
      ),
    );
  }
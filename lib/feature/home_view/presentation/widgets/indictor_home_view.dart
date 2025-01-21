import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/app_size.dart';

import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/feature/home_view/presentation/widgets/product_horizantal.dart';
class IndicatorHome extends StatelessWidget {
  const IndicatorHome({
    super.key,
    required this.items,
    required this.currentIndex,
  });

  final List<ProductHorizantal> items;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: items.length,
      position: currentIndex,
      decorator: const DotsDecorator(
        color: ColorsManager.grey, // Inactive dot color
        activeColor: ColorsManager.mainColor, // Active dot color
        size: Size(Appwidth.w8, AppHeight.h8), // Dot size
        activeSize: Size(Appwidth.w10, AppHeight.h10), // Active dot size
        spacing:
            EdgeInsets.symmetric(horizontal: Appwidth.w4), // Space between dots
      ),
    );
  }
}

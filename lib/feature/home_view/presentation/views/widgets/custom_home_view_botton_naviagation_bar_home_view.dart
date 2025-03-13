
  import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/utils/assets_manager.dart';
import 'package:splash_app/core/utils/color_manager.dart';

import '../../../../../core/utils/app_size.dart';
import '../../manager/cubits/bottom_navigation_bar_cubit.dart';
import 'custom_bottom_bar_item.dart';

BlocBuilder<BottomNavigationIndeCubit, int> customBottonNavigationBar(
      PageController pageController) {
    return BlocBuilder<BottomNavigationIndeCubit, int>(
        builder: (context, currentIndex) {
      return AnimatedNotchBottomBar(
        bottomBarHeight: 80,
        kBottomRadius: AppHeight.h8,
        kIconSize: 26,
        notchBottomBarController: NotchBottomBarController(index: currentIndex),
        notchColor: ColorsManager.darkgreen,
        color: ColorsManager.darkgreen,
        showLabel: false,
        bottomBarItems: [
          customBottomBarItem(imagePath: AssetsManager.homIcon),
          customBottomBarItem(imagePath: AssetsManager.mycarsIcon),
          customBottomBarItem(imagePath: AssetsManager.ordersIcon),
          customBottomBarItem(imagePath: AssetsManager.settingsIcon),
        ],
        onTap: (index) {
          context.read<BottomNavigationIndeCubit>().updateIndex(index);
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 400), // تحديد مدة الانتقال
            curve: Curves.easeInOut, // تأثير الحركة
          );
        },
        // child: CurvedNavigationBar(
        //   index: currentIndex,
        //   height: 60,
        //   items: <Widget>[
        //     CustomSvgButtonNavigationBarIcon(
        //       imagePath: 'assets/icon/home.svg',
        //     ),
        //     CustomSvgButtonNavigationBarIcon(
        //       imagePath: 'assets/icon/my_order_icon.svg',
        //     ),
        //     CustomSvgButtonNavigationBarIcon(
        //       imagePath: 'assets/icon/my_order_icon.svg',
        //     ),
        //     CustomSvgButtonNavigationBarIcon(
        //       imagePath: 'assets/icon/my_order_icon.svg',
        //     ),
        //   ],
        //   color: ColorsManager.darkgreen,
        //   buttonBackgroundColor: ColorsManager.darkgreen,
        //   backgroundColor: ColorsManager.white,
        //   animationCurve: Curves.easeInQuint,
        //   animationDuration: const Duration(milliseconds: 200),
        //   onTap: (index) {
        //     context.read<BottomNavigationIndeCubit>().updateIndex(index);
        //   },
        //   letIndexChange: (index) => true,
        // ),
      );
    });
  }

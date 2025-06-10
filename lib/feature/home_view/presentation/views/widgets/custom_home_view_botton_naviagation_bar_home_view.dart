import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:splash_app/core/utils/assets_manager.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/home_view/presentation/views/widgets/custom_svg_button_navigation_bar_item.dart';
import 'package:splash_app/feature/home_view/presentation/views/widgets/home_view_body.dart';
import '../../manager/cubits/bottom_navigation_bar_cubit.dart';
//ahmed
BlocBuilder<BottomNavigationIndeCubit, int> customBottonNavigationBar(
    PageController pageController, int index, BuildContext cotext1) {
  return BlocBuilder<BottomNavigationIndeCubit, int>(
      builder: (context, currentIndex) {
    return PersistentTabView(
      context,
      onItemSelected: (value) {
        context.read<BottomNavigationIndeCubit>().updateIndex(value);
      },
      screens: const [
        HomeViewBody(),
        HomeViewBody(),
        HomeViewBody(),
        HomeViewBody(),
      ],
      decoration: const NavBarDecoration(),
      items: [
        customButtomNavBarItem(
            title: 'Home',
            activeimagePath: AssetsManager.homIcon,
            inActiveimagePath: AssetsManager.homIcon1),
        customButtomNavBarItem(
            title: 'Cars',
            activeimagePath: AssetsManager.mycarsIcon,
            inActiveimagePath: AssetsManager.mycars1Icon),
        customButtomNavBarItem(
            title: 'Orders',
            activeimagePath: AssetsManager.ordersIcon,
            inActiveimagePath: AssetsManager.ordersIcon),
        customButtomNavBarItem(
            title: 'Settings',
            activeimagePath: AssetsManager.settingsIcon,
            inActiveimagePath: AssetsManager.settingsIcon1),
      ],
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      padding: const EdgeInsets.only(top: 0),
      backgroundColor: ColorsManager.white,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: 80,
      navBarStyle: NavBarStyle.style10,
    );
  });
}

PersistentBottomNavBarItem customButtomNavBarItem(
    {required String title,
    required String activeimagePath,
    required String inActiveimagePath}) {
  return PersistentBottomNavBarItem(
      title: title,
      textStyle:
          StylesManager.textStyleBold15.copyWith(color: ColorsManager.white),
      iconSize: 60,
      activeColorPrimary: ColorsManager.babyBlue,
      activeColorSecondary: ColorsManager.mainColor,
      inactiveIcon: CustomSvgButtonNavigationBarIcon(
          size: 32,
          color: ColorsManager.mainColor,
          imagePath: inActiveimagePath),
      icon: CustomSvgButtonNavigationBarIcon(
          size: 30,
          color: ColorsManager.mainColor,
          imagePath: activeimagePath));
}

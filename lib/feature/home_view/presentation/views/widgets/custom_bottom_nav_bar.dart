import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/utils/assets_manager.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import '../../manager/cubits/bottom_navigation_bar_cubit.dart';
import 'custom_bottom_nav_bar_item.dart';

class CustomButtonNavBar extends StatelessWidget {
  const CustomButtonNavBar({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: ColorsManager.mainColor,
      showSelectedLabels: true,
      selectedLabelStyle: StylesManager.textStyleBold15,
      currentIndex: index,
      onTap: (value) {
        context.read<BottomNavigationIndeCubit>().updateIndex(value);
      },
      items: [
        customBottomNavBarItem(
          activeIcon: AssetsManager.homIcon,
          inActiveIcon: AssetsManager.homIcon,
          title: 'Home',
          index: index,
        ),
        customBottomNavBarItem(
          activeIcon: AssetsManager.mycars1Icon,
          inActiveIcon: AssetsManager.mycars1Icon,
          title: 'Cars',
          index: index,
        ),
        customBottomNavBarItem(
          activeIcon: AssetsManager.ordersIcon,
          inActiveIcon: AssetsManager.ordersIcon,
          title: 'Orders',
          index: index,
        ),
        customBottomNavBarItem(
          activeIcon: AssetsManager.settingsIcon1,
          inActiveIcon: AssetsManager.settingsIcon1,
          title: 'Settings',
          index: index,
        ),
      ],
    );
  }
}

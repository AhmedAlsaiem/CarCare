import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/assets_manager.dart';
import 'package:splash_app/core/utils/color_manager.dart';

import 'package:splash_app/feature/setting/presentation/widgets/list_tile_widget.dart';
import 'package:splash_app/feature/setting/presentation/widgets/dialog_widget.dart';
import 'package:splash_app/feature/setting/presentation/widgets/switch_tile_widget.dart';

class SettingTecnicalViewBody extends StatefulWidget {
  const SettingTecnicalViewBody({super.key});

  @override
  State<SettingTecnicalViewBody> createState() =>
      _SettingTecnicalViewBodyState();
}

class _SettingTecnicalViewBodyState extends State<SettingTecnicalViewBody> {
  bool notifications = false;
  bool darkMode = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
      SizedBox(height: AppHeight.h20),

        // Notifications Switch
        SwitchListTileWidget(
          title: 'Notifications',
          value: notifications,
          onChanged: (value) {
            setState(() {
              notifications = value;
            });
          },
          activeIcon: AssetsManager.notificationOnIcon,
          inactiveIcon: AssetsManager.notificationOffIcon,
          activeColor: ColorsManager.mainColor,
        ),

        SizedBox(height: AppHeight.h14),

        // Dark Mode Switch
        SwitchListTileWidget(
          title: 'Dark Mode',
          value: darkMode,
          onChanged: (value) {
            setState(() {
              darkMode = value;
            });
          },
          activeIcon: AssetsManager.darkModeIcon,
          inactiveIcon: AssetsManager.lightModeIcon,
          activeColor: ColorsManager.mainColor,
        ),

        SizedBox(height: AppHeight.h14),

        // Share App
        ListTileWidget(
          title: 'Share App',
          icon: AssetsManager.shareIcon,
          // icon: Icons.share,
          onTap: () {},
        ),
        SizedBox(height: AppHeight.h14),

        ListTileWidget(
            title: 'Rate App',
            icon: AssetsManager.rateIcon,
            onTap: () {
              NavigatorManager.pushName(
                  context: context,
                  rootNavigator: true,
                  route: AppRoutes.feadbackView);
            }),

        SizedBox(height: AppHeight.h14),
        ListTileWidget(
            title: 'Profile',
            icon: AssetsManager.profile,
            // icon: Icons.person,
            onTap: () {
              NavigatorManager.pushName(
                  context: context,
                  route: AppRoutes.profileTechnicalView,
                  rootNavigator: true);
            }),
        SizedBox(height: AppHeight.h14),

        ListTileWidget(
            title: 'Messages',
            icon: AssetsManager.message,
            // icon: Icons.person,
            onTap: () {
              NavigatorManager.pushName(
                  context: context,
                  route: AppRoutes.messagetecnical,
                  rootNavigator: true);
            }),

        SizedBox(height: AppHeight.h14),

        // Logout
        ListTileWidget(
          title: 'Logout',
          icon: AssetsManager.logoutIcon,
          // icon: Icons.logout,
          onTap: () {
            showConfirmationDialog(
              context: context,
              title: 'Logout',
              desc: 'Are you sure you want to logout?',
              snackbarText: 'Logged out successfully!',
              onConfirm: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: ColorsManager.mainColor,
                    content: Text('Logged out successfully!'),
                  ),
                );
                NavigatorManager.pushWithReplacement(
                  context: context,
                  route: AppRoutes.loginView,
                );
              },
            );
          },
        ),
      ],
    );
  }
}

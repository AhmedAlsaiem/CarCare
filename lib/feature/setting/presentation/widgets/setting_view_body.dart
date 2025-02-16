import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';

import 'package:splash_app/feature/setting/presentation/widgets/list_tile_widget.dart';
import 'package:splash_app/feature/setting/presentation/widgets/dialog_widget.dart';
import 'package:splash_app/feature/setting/presentation/widgets/switch_tile_widget.dart';

class SettingViewBody extends StatefulWidget {
  const SettingViewBody({super.key});

  @override
  State<SettingViewBody> createState() => _SettingViewBodyState();
}

class _SettingViewBodyState extends State<SettingViewBody> {
  bool notifications = false;
  bool darkMode = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: AppHeight.h10),

        // Notifications Switch
        SwitchListTileWidget(
          title: 'Notifications',
          value: notifications,
          onChanged: (value) {
            setState(() {
              notifications = value;
            });
          },
          activeIcon: Icons.notifications_active,
          inactiveIcon: Icons.notifications_off,
          activeColor: ColorsManager.mainColor,
        ),

        SizedBox(height: AppHeight.h14),

        // Dark Mode Switch
        SwitchListTileWidget(
          title: 'Dark Mode',
          value: darkMode,
          // value: themeProvider.themeMode == ThemeMode.dark,
          onChanged: (value) {
            setState(() {
              darkMode = value;
            });
          },
          activeIcon: Icons.light_mode,
          inactiveIcon: Icons.dark_mode,
          activeColor: ColorsManager.mainColor,
        ),

        SizedBox(height: AppHeight.h14),

        // Share App
        ListTileWidget(
          title: 'Share App',
          icon: Icons.share,
          onTap: () {},
        ),
        SizedBox(height: AppHeight.h14),

        ListTileWidget(
            title: 'Rate App',
            icon: Icons.star_outline_rounded,
            onTap: () {
              NavigatorManager.pushName(
                  context: context, route: AppRoutes.ratingView);
            }),

        SizedBox(height: AppHeight.h14),

        // Delete Account
        ListTileWidget(
          title: 'Delete Account',
          icon: Icons.delete,
          onTap: () {
            showConfirmationDialog(
              context: context,
              title: 'Delete Account',
              desc: 'Are you sure you want to Delete Account?',
              snackbarText: 'Delete Account successfully!',
              onConfirm: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: ColorsManager.mainColor,
                    content: Text('Delete Account successfully!'),
                  ),
                );
                NavigatorManager.pushWithReplacement(
                  context: context,
                  route: AppRoutes.loginView,
                );
                // Add delete account logic here
              },
            );
          },
        ),

        SizedBox(height: AppHeight.h14),

        // Logout
        ListTileWidget(
          title: 'Logout',
          icon: Icons.logout,
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

import 'package:flutter/material.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/helper/cache_helper.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/assets_manager.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
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
    return Container(
      color: ColorsManager.mainColor,
      child: Container(
        decoration: const BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ListView(
          children: [
            SizedBox(height: AppHeight.h50),
            ListTileWidget(
              title: StringsManager.profile,
              icon: AssetsManager.profile,
              onTap: () {
                NavigatorManager.pushName(
                    context: context, route: AppRoutes.userPofileView);
              },
            ),

            SizedBox(height: AppHeight.h14),
            SwitchListTileWidget(
              title: StringsManager.notification,
              value: notifications,
              onChanged: (value) {
                setState(() {
                  notifications = value;
                });
              },
              activeIcon: AssetsManager.notificationOffIcon,
              inactiveIcon: AssetsManager.notificationOnIcon,
              activeColor: ColorsManager.mainColor,
            ),

            SizedBox(height: AppHeight.h14),

            // Dark Mode Switch
            SwitchListTileWidget(
              title: StringsManager.darkMode,
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
              title: StringsManager.share,
              icon: AssetsManager.shareIcon,
              onTap: () {},
            ),
            SizedBox(height: AppHeight.h14),

            ListTileWidget(
                title: StringsManager.rate,
                icon: AssetsManager.rateIcon,
                onTap: () {
                  NavigatorManager.pushName(
                      context: context, route: AppRoutes.ratingView);
                }),

            SizedBox(height: AppHeight.h14),

            // Delete Account

            // Logout
            ListTileWidget(
              title: StringsManager.logout,
              icon: AssetsManager.logoutIcon,
              onTap: () {
                showConfirmationDialog(
                  context: context,
                  title: 'Logout',
                  desc: 'Are you sure you want to logout?',
                  snackbarText: 'Logged out successfully!',
                  onConfirm: () {
                    CacheHelper.sharedPreferences.remove(ApiKey.token);
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
        ),
      ),
    );
  }
}

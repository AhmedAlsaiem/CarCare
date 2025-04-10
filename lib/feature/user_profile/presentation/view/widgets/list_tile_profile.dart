import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/feature/user_profile/presentation/view/widgets/custom_list_tile_profile.dart';

class ListTileProfile extends StatelessWidget {
  const ListTileProfile({
    required this.title,
    required this.icon,
    required this.onTap,
    required this.controller,
    super.key,
  });

  final String title;
  final String icon;
  final void Function()? onTap;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: Card(
        margin: const EdgeInsets.only(
            left: AppSize.s8, right: AppSize.s8, bottom: AppSize.s16),
        color: ColorsManager.white,
        elevation: 5,
        child: Center(
          child: CustomListTileProfile(
            icon: icon,
            title: title,
            onTap: onTap,
            controller: controller,
          ),
        ),
      ),
    );
  }
}

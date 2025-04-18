// ignore: file_names


import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/home_view/presentation/views/widgets/custom_svg_button_navigation_bar_item.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key,
  });

  final String title;
  final String icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: Card(
        margin: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
        color: ColorsManager.white,
        // elevation: 5,
        child: Center(
          child: ListTile(
            leading: CustomSvgButtonNavigationBarIcon(
              color: ColorsManager.mainColor,
              imagePath: icon,
            ),
            title: Text(
              title,
              style: StylesManager.textStyleBold17
                  .copyWith(color: ColorsManager.mainColor),
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}

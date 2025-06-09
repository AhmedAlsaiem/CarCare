import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/home_view/presentation/views/widgets/custom_svg_button_navigation_bar_item.dart';

class SwitchListTileWidget extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final String activeIcon;
  final String inactiveIcon;
  final Color activeColor;

  const SwitchListTileWidget({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    required this.activeIcon,
    required this.inactiveIcon,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: Card(
        margin: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
        color: ColorsManager.white,
        //   elevation: 5,
        child: Center(
          child: ListTile(
            title: Text(title,
                style: StylesManager.textStyleBold17
                    .copyWith(color: ColorsManager.mainColor)),
            trailing: Switch(
              inactiveTrackColor: ColorsManager.white,
              hoverColor: Colors.white,
              inactiveThumbColor: ColorsManager.mainColor,
              focusColor: Colors.red,
              onChanged: onChanged,
              value: value,
              activeTrackColor: activeColor,
            ),
            leading: value
                ? CustomSvgButtonNavigationBarIcon(
                    color: ColorsManager.mainColor,
                    size: 30,
                    imagePath: activeIcon,
                  )
                : CustomSvgButtonNavigationBarIcon(
                    size: 30,
                    color: ColorsManager.mainColor,
                    imagePath: inactiveIcon,
                  ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class SwitchListTileWidget extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final IconData activeIcon;
  final IconData inactiveIcon;
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
        margin: const EdgeInsets.only(left: 8 , right: 8  , bottom: 16),
        color: Colors.grey[320], 
        elevation: 5,
        child: Center(
          child: ListTile(
            
            title: Text(
              title,
              style: StylesManager.textStyleBold20.copyWith(color: ColorsManager.mainColor)
            ),
            trailing: Switch(
              onChanged: onChanged,
              value: value,
              activeTrackColor: activeColor,
              
            ),
            leading: Icon(
              size: 30,
              value ? activeIcon : inactiveIcon,
              color: value ? activeColor : ColorsManager.mainColor,
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart' show ColorsManager;
import 'package:splash_app/core/utils/styles_manager.dart';

class CustomRadioListTile extends StatelessWidget {
  const CustomRadioListTile({
    super.key,
    required this.selectedOption,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.onchange,
  });
  final ValueChanged<String?>? onchange;
  final String? selectedOption;
  final String title;
  final String subtitle;
  final String price;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<String>(
      activeColor: ColorsManager.mainColor,
      title: Text(
        title,
        style: StylesManager.textStyleSemiBold18.copyWith(
          color: ColorsManager.mainColor,
          fontWeight:
              selectedOption == title ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      secondary: Text(
        '$price EGP',
        style: StylesManager.textStyleRegular10.copyWith(color: Colors.black),
      ),

      subtitle: Text(
        subtitle,
        style: StylesManager.textStyleRegular14
            .copyWith(color: ColorsManager.black),
      ), // Add description here
      value: title,
      groupValue: selectedOption,
      onChanged: onchange,
    );
  }
}

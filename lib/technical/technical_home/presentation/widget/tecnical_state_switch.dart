import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:splash_app/core/utils/color_manager.dart';

class TechnicalStatusSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onToggle;

  const TechnicalStatusSwitch({super.key, required this.value, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      width: 60.0,
      height: 30.0,
      toggleSize: 20.0,
      value: value,
      borderRadius: 30.0,
      padding: 3.0,
      activeColor: ColorsManager.mainColor,
      inactiveColor: Colors.grey,
      activeText: "ON",
      inactiveText: "OFF",
      showOnOff: true,
      onToggle: onToggle,
    );
  }
}
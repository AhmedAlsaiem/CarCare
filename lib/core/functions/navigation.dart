// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
// good 
abstract class NavigatorManager {
//? navigation without delay
  void navigation({
    required BuildContext context,
    required String route,
  }) {
    Navigator.pushNamed(context, route);
  }
//data
//? navigation with delay time
  void navigationdelay({
    required BuildContext context,
    required String route,
  }) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushNamed(context, route);
    });
  }
}

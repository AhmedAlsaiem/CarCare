// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

abstract class NavigatorManager {
//? navigation without delay
  static void pushName({
    required BuildContext context,
    required String route,
    bool rootNavigator = false,

  }) {
   // Navigator.pushNamed(context, route);
     Navigator.of(context, rootNavigator: rootNavigator).pushNamed(route);

  }
// static void pushWithReplacement({
//     required BuildContext context,
//     required String route,
    
//   }) {
//     Navigator.pushReplacementNamed(context, route);
//   }
static void pushWithReplacement({
    required BuildContext context,
    required String route,
    bool rootNavigator = false, 
  }) {
    Navigator.of(context, rootNavigator: rootNavigator).pushReplacementNamed(route);
  }
//? navigation with delay time
  static void navigationdelay({
    required BuildContext context,
    required String route,
  }) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushNamed(context, route);
    });
  }
  static void pop({
    required BuildContext context,
  }) {
    Navigator.pop(context);
  }
}

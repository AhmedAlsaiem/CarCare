
import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/network/app_router.dart';

List<void Function()?> handleAllServiceRouting(BuildContext context) {
  return [
    () {
      NavigatorManager.pushName(
        context: context,
        route: AppRoutes.wichCarView,
      );
    },
    () {
      NavigatorManager.pushName(
        context: context,
        route: AppRoutes.tireCarView,
      );
    },
    () {
      NavigatorManager.pushName(
        context: context,
        route: AppRoutes.fuelCarView,
      );
    },
    () {
      NavigatorManager.pushName(
        context: context,
        route: AppRoutes.batteriesCarView,
      );
    },
    () {
      NavigatorManager.pushName(
        context: context,
        route: AppRoutes.oilCarView,
      );
    },
    () {
      NavigatorManager.pushName(
        context: context,
        route: AppRoutes.mechanicCarView,
      );
    },
    () {
      NavigatorManager.pushName(
        context: context,
        route: AppRoutes.mapView,
      );
    },
    () {
      NavigatorManager.pushName(
        context: context,
        route: AppRoutes.mapView,
      );
    },
    () {
      NavigatorManager.pushName(
        context: context,
        route: AppRoutes.mapView,
      );
    },
  ];
}

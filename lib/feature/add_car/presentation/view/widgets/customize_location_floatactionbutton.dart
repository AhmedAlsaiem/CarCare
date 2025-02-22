import 'package:flutter/material.dart';

class CustomFABLocation extends FloatingActionButtonLocation {
  final double xOffset;
  final double yOffset;

  CustomFABLocation(this.xOffset, this.yOffset);

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    // Define custom position based on scaffold size
    final double fabX = scaffoldGeometry.scaffoldSize.width * xOffset -
        scaffoldGeometry.floatingActionButtonSize.width / 2;
    final double fabY = scaffoldGeometry.scaffoldSize.height * yOffset -
        scaffoldGeometry.floatingActionButtonSize.height / 2;
    return Offset(fabX, fabY);
  }
}

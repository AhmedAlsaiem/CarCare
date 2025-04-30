import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

AppBar buildAppBar({final String? title}) {
  return AppBar(
    leading: Center(
      child: SvgPicture.asset(
        'assets/images/arrow.svg',
      ),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Text(
      title ?? '',
      textAlign: TextAlign.center,
      style: StylesManager.style25,
    ),
  );
}

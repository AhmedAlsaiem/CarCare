
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:splash_app/core/utils/color_manager.dart';

class CustomSvgButtonNavigationBarIcon extends StatelessWidget {
  const CustomSvgButtonNavigationBarIcon({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      alignment: Alignment.center,
      height: 40,
      width: 40,
      fit: BoxFit.cover,
      imagePath,
      colorFilter: const ColorFilter.mode(
        ColorsManager.white,
        BlendMode.srcIn,
      ),
    );
  }
}

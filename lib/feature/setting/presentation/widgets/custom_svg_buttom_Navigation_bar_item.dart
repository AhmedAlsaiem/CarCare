import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgButtonNavigationBarIcon extends StatelessWidget {
  const CustomSvgButtonNavigationBarIcon(
      {super.key, required this.imagePath, required this.color});
  final String imagePath;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      alignment: Alignment.center,
      height: 30,
      width: 30,
      fit: BoxFit.cover,
      imagePath,
      colorFilter: ColorFilter.mode(
        color,
        BlendMode.srcIn,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgButtonNavigationBarIcon extends StatelessWidget {
  const CustomSvgButtonNavigationBarIcon(
      {super.key,
      required this.imagePath,
      required this.color,
      required this.size});
  final String imagePath;
  final Color color;
  final double size;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      alignment: Alignment.center,
      height: size,
      width: size,
      //   fit: BoxFit.fill,
      imagePath,
      colorFilter: ColorFilter.mode(
        color,
        BlendMode.srcIn,
      ),
    );
  }
}

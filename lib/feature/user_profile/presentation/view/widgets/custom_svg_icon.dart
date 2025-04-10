import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:splash_app/core/utils/app_size.dart';

class CustomSvgIcon extends StatelessWidget {
  const CustomSvgIcon({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      alignment: Alignment.center,
      height: AppSize.s34,
      width: AppSize.s34,
      fit: BoxFit.cover,
      imagePath,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 50,
      backgroundColor: ColorsManager.white,
      child: CircleAvatar(
        radius: 40,
        backgroundColor: ColorsManager.babyBlue,
        child: Icon(
          Icons.check,
          size: 50,
          color: ColorsManager.white,
        ),
      ),
    );
  }
}

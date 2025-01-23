
import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

import '../../../../../core/utils/color_manager.dart';

class CustomUserType extends StatelessWidget {
  const CustomUserType({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onTap,
    required this.value,
  });
  final String imageUrl;
  final String title;
  final bool value;

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200,
        width: 300,
        decoration: BoxDecoration(
            color: value
                ? const Color.fromARGB(49, 99, 110, 129)
                : ColorsManager.mainColor,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: AppSize.s20),
            SizedBox(
              height: 125,
              width: 200,
              child: Image.asset(
                imageUrl,
                color: value ? ColorsManager.mainColor : ColorsManager.white,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              title,
              textAlign: TextAlign.right,
              style: StylesManager.textStyleBold28.copyWith(
                  color: value ? ColorsManager.mainColor : ColorsManager.white),
            ),
          ],
        ),
      ),
    );
  }
}

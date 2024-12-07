import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class CustomOnboardingText extends StatelessWidget {
  final String title;
  final String subTitle;
  const CustomOnboardingText({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s40),
      child: Column(
        children: [
          const SizedBox(
            height: AppSize.s480,
          ),
          Text(
            title,
            style: StylesManager.textStyleExtraBold32,
          ),
          Text(
            textAlign: TextAlign.center,
            subTitle,
            style: StylesManager.textStyleMedium18,
          ),
        ],
      ),
    );
  }
}

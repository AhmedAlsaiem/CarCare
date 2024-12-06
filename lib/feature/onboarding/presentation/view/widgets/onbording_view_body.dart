import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      width: double.infinity,
      color: ColorsManager.white,
      child:const Column(
        children: [],
      ),
    ));
  }
}

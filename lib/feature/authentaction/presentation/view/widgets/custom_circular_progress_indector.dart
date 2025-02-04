

import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator.adaptive(
      backgroundColor: ColorsManager.darkBlue,
    );
  }
}

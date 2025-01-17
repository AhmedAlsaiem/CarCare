
import 'package:flutter/material.dart';

class CustomOnboardingImage extends StatelessWidget {
  const CustomOnboardingImage({
    super.key,
    required this.image,
  });
  final String image;
  @override
  
  Widget build(BuildContext context) {
    return SizedBox(
        height: 600,
        child: Center(
            child: Image.asset(
          image,
          alignment: Alignment.center,
        )));
  }
}

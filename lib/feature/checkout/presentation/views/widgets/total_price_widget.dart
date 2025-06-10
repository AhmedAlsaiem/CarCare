import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.title, required this.value});

  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: StylesManager.style24,
        ),
        const Spacer(),
        Text(
          value,
          textAlign: TextAlign.center,
          style: StylesManager.style24,
        )
      ],
    );
  }
}

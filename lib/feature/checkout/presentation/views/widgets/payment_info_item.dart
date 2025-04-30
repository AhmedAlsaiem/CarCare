import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo({super.key, required this.title, required this.value});
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: StylesManager.style18,
        ),
        Text(
          value,
          style: StylesManager.styleBold18,
        )
      ],
    );
  }
}

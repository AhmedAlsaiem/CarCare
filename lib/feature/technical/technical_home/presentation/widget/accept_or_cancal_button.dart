import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class AcceptOrCancalButton extends StatelessWidget {
  const AcceptOrCancalButton({
    required this.background,
    required this.color,
    required this.text,
    required this.onpressed,
    super.key,
  });
  final Color background;
  final Color color;
  final String text;
  final void Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: background, // Background color
      ),
      onPressed: onpressed,
      child: Text(
        text,
        style: StylesManager.textStyleBold20.copyWith(color: color),
      ),
    );
  }
}

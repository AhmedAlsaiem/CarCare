import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({super.key, required this.title, required this.value});
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
        SizedBox(
          width: context.screenWidth * 0.5,
          child: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            value,
            textAlign: TextAlign.center,
            style: StylesManager.style18,
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class PrfileTecnicalitem extends StatelessWidget {
  const PrfileTecnicalitem({
    required this.text,
    required this.iconData,

    super.key,
  });
  final String text;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: Card(
        margin: const EdgeInsets.only(left: 8, right: 8, bottom: 16 , ),
          color: Colors.grey[100],
          elevation: 5,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
               Icon(
               iconData,
                size: 32,
                color: ColorsManager.mainColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  text,
                  style: StylesManager.textStyleBold20black,
                  maxLines:1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

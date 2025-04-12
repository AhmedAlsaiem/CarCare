import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class RatingTypeWidget extends StatelessWidget {
  const RatingTypeWidget({
    required this.text, 
    required this.ontap , 
    super.key,
  });
 final  String text;
 final  void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: SizedBox(
        height: 100,
        width: context.screenWidth,
        child: Card(
          margin: const EdgeInsets.all(16),
          color: Colors.grey[100],
          elevation: 5,
          // elevation: ,
          child: Center(
              child: Text(
            text,
            style: StylesManager.textStyleBold24
                .copyWith(color: ColorsManager.mainColor),
          )),
        ),
      ),
    );
  }
}

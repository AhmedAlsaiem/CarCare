import 'package:flutter/material.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class AppbarTitle extends StatelessWidget {
  const AppbarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: ColorsManager.white,
      child: Container(
        padding: EdgeInsets.only(left: Appwidth.w8),
        // margin: const EdgeInsets.all(0),
        height: AppHeight.h60,
        width: context.screenWidth,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Add a car ',
            textAlign: TextAlign.start,
            style: StylesManager.textStyleBold22black,
          ),
        ),
      ),
    );
  }
}

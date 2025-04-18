import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/assets_manager.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class GooglePlayWidget extends StatelessWidget {
  const GooglePlayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: Appwidth.w16, top: AppHeight.h8, bottom: AppHeight.h8),
      height: AppHeight.h74,
      width: Appwidth.w230,
      decoration: BoxDecoration(
          color: ColorsManager.mainColor,
          borderRadius: BorderRadius.circular(AppHeight.h16)),
      child: Row(
        children: [
          Image.asset(AssetsManager.googlePlay),
          SizedBox(
            width: Appwidth.w6,
          ),
          Column(
            children: [
              Text(
                'REVIEW US ON',
                style: StylesManager.textStyleBold16,
              ),
              Text(
                'Google play',
                style: StylesManager.textStyleBold24,
              )
            ],
          ),
        ],
      ),
    );
  }
}

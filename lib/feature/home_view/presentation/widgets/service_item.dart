import 'package:flutter/material.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/font_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({
    required this.title,
    required this.subTitle,
    required this.imagePath,
    super.key,
  });
  final String title;
  final String subTitle;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: Appwidth.w16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        elevation: 2,

        //color: ColorsManager.grey.withOpacity(.5),
        child: Padding(
          padding: const EdgeInsets.all(AppSize.s8),
          child: SizedBox(
            // height: 200,
            // width: 200,

            height: context.screenHeight * 0.45,
            width: context.screenWidth * 0.4,
            child: Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Image.asset(
                  imagePath,
                  height: Appwidth.w80,
                  width: AppHeight.h80,
                  fit: BoxFit.cover,
                ),
                //   const SizedBox(height: 16),
                Text(title, style: StylesManager.textStyleBold26MainColor),
                SizedBox(height: AppHeight.h8),
                SizedBox(
                  width: context.screenWidth * 0.35,
                  child: Text(
                    subTitle,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: FontSize.s14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

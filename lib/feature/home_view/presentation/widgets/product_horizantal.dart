import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class ProductHorizantal extends StatelessWidget {
  final String title;
  final String subTitle;
  final String pathImage;
  final String navigatePage;
  const ProductHorizantal({
    super.key,
    required this.title,
    required this.subTitle,
    required this.pathImage,
    required this.navigatePage,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigatorManager.pushName(
            context: context, route: navigatePage);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Appwidth.w10),
        child: Card(
          elevation: 2,
          // color: ColorsManager.mainColor,
          //color: ColorsManager.grey.withValues(alpha: (0.3 * 255),),
          color: ColorsManager.white.withValues(
            alpha: (0.1 * 255),
          ),

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s16)),
          child: SizedBox(
            height: context.screenHeight * .15,
            // width: context.screenWidth * 0.82,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSize.s16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Text(
                            title,
                            maxLines: 1,
                            style: StylesManager.textStyleBold24maincolor,
                          ),
                        ),
                        Text(
                          subTitle,
                          maxLines: 2,
                          style: StylesManager.textStyle16.copyWith(),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: context.screenHeight * .15,
                  width: context.screenWidth * 0.3,
                  child: Image.asset(
                    pathImage,
                    // width: 100,
                    // height: 100.0, // Adjust image size as needed
                    fit: BoxFit.cover,
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

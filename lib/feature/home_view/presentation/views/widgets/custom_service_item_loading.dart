
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/font_manager.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/styles_manager.dart';

class ServiceItemIndector extends StatelessWidget {
  const ServiceItemIndector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Shimmer.fromColors(
        enabled: true,
        baseColor: ColorsManager.lightGrey,
        highlightColor: ColorsManager.grey.withAlpha(120),
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: ColorsManager.grey.withAlpha(90),
              borderRadius: BorderRadius.circular(AppSize.s12)),
          child: Padding(
            padding: const EdgeInsets.all(AppSize.s8),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  AnimatedContainer(
                    curve: Curves.linear,
                    duration:const Duration(microseconds: 30),
                    color: Colors.grey,
                    height: AppSize.s64,
                    width: AppSize.s64,
                    child:const Text(''),
                    // child: Image.asset(AssetsManager.googlePlay),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: AppSize.s6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: ColorsManager.froridaOrange,
                          child: Text('                        ',
                              style: StylesManager.textStyleSemiBold18.copyWith(
                                  color: ColorsManager.darkBlue,
                                  backgroundColor: ColorsManager.darkBlue)),
                        ),
                        SizedBox(height: AppHeight.h4),
                        Container(
                          color: Colors.grey,
                          width: context.screenWidth * 0.35,
                          child: Text(
                            '                                                ',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              backgroundColor: ColorsManager.darkgreen,
                              fontSize: FontSize.s12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

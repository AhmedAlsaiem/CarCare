import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/change_theme.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

import '../../../../../core/utils/string_manager.dart';

class CustomOrderItem extends StatelessWidget {
  const CustomOrderItem({
    super.key,
    required this.value,
  });
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSize.s12),
      child: Container(
        decoration: BoxDecoration(
          color: changeColor(status: value),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSize.s12),
          ),
        ),
        height: context.screenHeight * 0.22,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                decoration: const BoxDecoration(
                  color: ColorsManager.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(AppSize.s20),
                    bottomRight: Radius.circular(AppSize.s20),
                    topLeft: Radius.circular(AppSize.s12),
                    topRight: Radius.circular(AppSize.s12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: AppSize.s16, horizontal: AppSize.s12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Expanded(child: SizedBox()),
                      CircleAvatar(
                        radius: AppSize.s32,
                        backgroundColor: ColorsManager.white,
                        backgroundImage: AssetImage(
                          changeImage(status: value),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: AppSize.s20),
                          Text(
                            'Ahmed Alsaeim',
                            style:
                                StylesManager.textStyleRegular16grey.copyWith(
                              color: ColorsManager.balck,
                            ),
                          ),
                          Text(
                            '01025113791',
                            style:
                                StylesManager.textStyleRegular16grey.copyWith(
                              color: ColorsManager.balck,
                            ),
                          ),
                          Text(
                            'Winch Driver',
                            style:
                                StylesManager.textStyleRegular16grey.copyWith(
                              color: ColorsManager.balck,
                            ),
                          ),
                        ],
                      ),
                      const Expanded(
                        flex: 3,
                        child: SizedBox(),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                          backgroundColor: const WidgetStatePropertyAll(
                            ColorsManager.darkGrey,
                          ),
                        ),
                        child: Text(
                          StringsManager.rate,
                          style: StylesManager.textStyleBold16,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.s12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringsManager.orderStatus,
                      style: StylesManager.textStyleBold17.copyWith(
                        color: ColorsManager.white,
                      ),
                    ),
                    Text(
                      StringsManager.done,
                      style: StylesManager.textStyleBold17.copyWith(
                        color: ColorsManager.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

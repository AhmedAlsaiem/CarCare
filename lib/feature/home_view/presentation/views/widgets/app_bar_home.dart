import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/assets_manager.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Appwidth.w16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            StringsManager.home,
            style: StylesManager.textStyleBold20black,
          ),
          GestureDetector(
            onTap: () {},
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: AppSize.s30,
                  backgroundColor: ColorsManager.brightGrey,
                  child: SvgPicture.asset(
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    AssetsManager.notificationOnIcon,
                    colorFilter: const ColorFilter.mode(
                      ColorsManager.darkgreen,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Positioned(
                  bottom: AppSize.s2,
                  right: AppSize.s2,
                  child: CircleAvatar(
                    radius: AppSize.s8,
                    backgroundColor: ColorsManager.mainColor,
                    child: Text(
                      '1',
                      textAlign: TextAlign.center,
                      style: StylesManager.textStyleRegular10,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

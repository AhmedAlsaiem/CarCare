import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/assets_manager.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class AppbarHome extends StatelessWidget {
  const AppbarHome({
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
            // (MediaQuery.of(context).size.height.toString()),

            StringsManager.home,
            style: StylesManager.textStyleBold20black,
          ),
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              radius: AppSize.s20,
              backgroundColor: ColorsManager.brightGrey,
              child: SvgPicture.asset(
                alignment: Alignment.center,
                fit: BoxFit.cover,
                AssetsManager.user,
                colorFilter: const ColorFilter.mode(
                  ColorsManager.darkgreen,
                  BlendMode.srcIn,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

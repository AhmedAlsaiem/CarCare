
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class ChoiseServiceTextAndIcon extends StatelessWidget {
  const ChoiseServiceTextAndIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: Appwidth.w16),
      child: Row(
        children: [
          const FaIcon(
            FontAwesomeIcons.gears,
            color: ColorsManager.mainColor,
            size: AppSize.s26,
          ),
           SizedBox(
            width: Appwidth.w6,
          ),
          Text(
            StringsManager.choiseAservice,
            style: StylesManager.textStyleBold26MainColor,
          )
          //Icon(FontAwesomeIcons.se)
        ],
      ),
    );
  }
}

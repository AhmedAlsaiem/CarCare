import 'package:flutter/material.dart';
import 'package:screenutil_module/main.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class RequesButton extends StatelessWidget {
  const RequesButton({
    required this.selectedOption,
    super.key,
  });

  final String selectedOption;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (selectedOption != ' ') {
          NavigatorManager.pushName(
              context: context, route: AppRoutes.recomendation);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: ColorsManager.mainColor,
                content: Text('You selected: $selectedOption')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                backgroundColor: ColorsManager.mainColor,
                content: Text(StringsManager.youshouldchoiseanyopation)),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: Appwidth.w24),
        //    padding: EdgeInsets.symmetric(horizontal: Appwidth.w50),
        height: AppHeight.h50,
        width: context.screenWidth,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(AppSize.s8.r),
          color: ColorsManager.mainColor,
        ),
        child: Center(
          child: Text(
            StringsManager.request,
            style: StylesManager.textStyleBold24
                .copyWith(color: ColorsManager.balck),
          ),
        ),
      ),
    );
  }
}

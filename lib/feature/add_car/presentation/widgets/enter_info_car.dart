import 'package:flutter/material.dart';
import 'package:screenutil_module/main.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/add_car/presentation/widgets/text_form_details.dart';

class EnterInfoCar extends StatelessWidget {
  const EnterInfoCar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsManager.white.withValues(),
      margin: EdgeInsets.only(
          left: Appwidth.w22, right: Appwidth.w22, top: Appwidth.w12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s12.r),
      ),
      elevation: 2,
      child: Padding(
        padding:  EdgeInsets.all(AppSize.s12.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(
              height: AppHeight.h10,
            ),
            Text(
             StringsManager.addYourCar ,
              style: StylesManager.textStyleBold20black,
            ),
            Text(
              StringsManager.addYourVehicleDetails,
              style: StylesManager.textStyleRegular14grey.copyWith(
                  color: ColorsManager.balck.withAlpha(100)),
            ),
            Text(StringsManager.assistyouQuickly,
                style: StylesManager.textStyleRegular14grey.copyWith(
                    color: ColorsManager.balck.withAlpha(100))),
            SizedBox(
              height: AppHeight.h6,
            ),
            const Divider(
              color: ColorsManager.grey,
            ),
            SizedBox(
              height: AppHeight.h16,
            ),
            const TextFormDetails(
                labalText: StringsManager.modelNamelabel,
                hintText: StringsManager.modelNameHint,
                valaidText: StringsManager.modelNameValaidText),
            SizedBox(
              height: AppHeight.h18,
            ),
            const TextFormDetails(
                labalText: StringsManager.modelColorlabel,
                hintText: StringsManager.modelColorHint,
                valaidText:StringsManager.modeColorValaidText),
            SizedBox(
              height: AppHeight.h18,
            ),
            const TextFormDetails(
                labalText: StringsManager.modelYearlabel,
                hintText: StringsManager.modelYearHint,
                valaidText: StringsManager.modelYearValaidText,
                ),
          ],
        ),
      ),
    );
  }
}


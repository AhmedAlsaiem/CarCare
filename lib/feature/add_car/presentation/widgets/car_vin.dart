import 'package:flutter/material.dart';
import 'package:screenutil_module/main.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/add_car/presentation/widgets/text_form_details.dart';

class CarVin extends StatelessWidget {
  const CarVin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsManager.white.withValues(),
      margin: EdgeInsets.only(
          left: Appwidth.w22, right: Appwidth.w22, top: Appwidth.w16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s12.r),
      ),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(AppSize.s12.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringsManager.addYourCarsVin,
              style: StylesManager.textStyleBold20black,
            ),
            Text(
              StringsManager.enterShassis,
              style: StylesManager.textStyleRegular14grey
                  .copyWith(color: ColorsManager.balck.withAlpha(100)),
            ),
            Text(StringsManager.vehicleWithoutAnySpace,
                style: StylesManager.textStyleRegular14grey
                    .copyWith(color: ColorsManager.balck.withAlpha(100))),
            const TextFormDetails(
              labalText: StringsManager.modelVinlabel,
              hintText: StringsManager.modelVinHint,
              valaidText: StringsManager.modelVinValaidText,
            ),
          ],
        ),
      ),
    );
  }
}

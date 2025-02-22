import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenutil_module/main.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/add_car/presentation/manager/cubit/car_cubit.dart';
import 'package:splash_app/feature/add_car/presentation/view/widgets/text_form_details.dart';

class EnterInfoCar extends StatelessWidget {
  const EnterInfoCar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsManager.white.withValues(),
      margin:
          EdgeInsets.symmetric(horizontal: Appwidth.w22, vertical: AppSize.s03),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s8.h),
      ),
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.only(
            left: AppSize.s12.r, right: AppSize.s12.r, bottom: AppSize.s12.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppHeight.h10,
            ),
            Text(
              StringsManager.addYourCar,
              style: StylesManager.textStyleBold16
                  .copyWith(color: ColorsManager.balck),
            ),
            SizedBox(
              width: context.screenWidth * 0.75,
              child: Text(
                StringsManager.addYourVehicleDetails,
                style: StylesManager.textStyleRegular14grey
                    .copyWith(color: ColorsManager.balck.withAlpha(100)),
              ),
            ),
            SizedBox(
              height: AppHeight.h6,
            ),
            const Divider(
              color: ColorsManager.grey,
            ),
            SizedBox(
              height: AppHeight.h10,
            ),
            TextFormDetails(
              controller: context.read<CarCubit>().model,
              labalText: StringsManager.modelNamelabel,
              hintText: StringsManager.modelNameHint,
              valaidText: StringsManager.modelNameValaidText,
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: AppHeight.h12,
            ),
            TextFormDetails(
              controller: context.read<CarCubit>().color,
              labalText: StringsManager.modelColorlabel,
              hintText: StringsManager.modelColorHint,
              valaidText: StringsManager.modeColorValaidText,
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: AppHeight.h12,
            ),
            TextFormDetails(
              controller: context.read<CarCubit>().year,
              labalText: StringsManager.modelYearlabel,
              hintText: StringsManager.modelYearHint,
              valaidText: StringsManager.modelYearValaidText,
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}

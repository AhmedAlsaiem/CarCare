import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenutil_module/main.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/add_car/presentation/manager/cubit/car_cubit.dart';
import 'package:splash_app/feature/add_car/presentation/view/widgets/text_form_details.dart';

class CarVin extends StatelessWidget {
  const CarVin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsManager.white.withValues(),
      margin: EdgeInsets.only(
          left: Appwidth.w16.w, right: Appwidth.w16.w, top: Appwidth.w16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s12.r),
      ),
      elevation: 8,
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
            TextFormDetails(
              controller: context.read<CarCubit>().vinNumber,
              labalText: StringsManager.modelVinlabel,
              hintText: StringsManager.modelVinHint,
              valaidText: StringsManager.modelVinValaidText,
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}

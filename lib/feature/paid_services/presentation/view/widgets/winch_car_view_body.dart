import 'package:flutter/material.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/paid_services/presentation/view/widgets/custom_radio_list_tile_list_view_builder.dart';

import 'request_button.dart';

class WinchCarViewBody extends StatelessWidget {
  const WinchCarViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppHeight.h16,
        ),
        Padding(
          padding: EdgeInsets.only(
              right: Appwidth.w20, top: AppHeight.h12, left: Appwidth.w12),
          child: Text(
            StringsManager.choosehewinchtype,
            style: StylesManager.textStyleBold20black,
          ),
        ),
        const CustomRadioListtileListViewBuilder(),
        SizedBox(
          height: context.screenHeight * .2,
        ),
        const RequesButton(selectedOption: 'selectedOption'),
        SizedBox(
          height: AppHeight.h30,
        )
      ],
    );
  }
}


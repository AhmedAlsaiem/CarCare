import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/paid_services/presentation/manager/get_techinical_cubit/get_all_techincal_cubit.dart';
import 'package:splash_app/feature/paid_services/presentation/manager/service_request_manual_cubit/service_request_manual_cubit.dart';
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
        CustomRadioListtileListViewBuilder(
          options: options,
          selectedOption: "Electric",
        ),
        SizedBox(
          height: context.screenHeight * .2,
        ),
        RequesButton(
          onTap: () {
            context.read<GetAllTechincalCubit>().serviceId = 1;
            context.read<ServiceRequestManualCubit>().serviceId = 1;

            NavigatorManager.pushName(
                context: context, route: AppRoutes.selectTechincalView);
          },
        ),
        SizedBox(
          height: AppHeight.h30,
        )
      ],
    );
  }
}

final List<Map<String, String>> options = [
  {
    'title': ' Electric',
    'description': ' Common for smaller vehicles and occasional',
    'price': '500'
  },
  {
    'title': ' Hydraulic',
    'description': ' Better for heavy-duty',
    'price': '1000'
  },
];

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/paid_services/presentation/manager/get_techinical_cubit/get_all_techincal_cubit.dart';
import '../../manager/service_request_manual_cubit/service_request_manual_cubit.dart';
import 'choise_amount.dart';
import 'custom_radio_list_tile_list_view_builder.dart';
import 'request_button.dart';

class FuelCarViewBody extends StatelessWidget {
  FuelCarViewBody({super.key});

  final List<Map<String, String>> options = [
    {
      'title': 'p80',
      'description': '  vehicles with low to mid-performance .',
      'price': '17'
    },
    {
      'title': 'p92',
      'description': '  fuel with a higher octane',
      'price': '19'
    },
    {
      'title': 'Gaz',
      'description': ' Retrofitted passenger cars',
      'price': '14'
    },
  ];

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
          selectedOption: "Regular benzine",
        ),
        const ChoiseAmount(),
        SizedBox(
          height: context.screenHeight * .2,
        ),
        RequesButton(
          onTap: () {
            context.read<ServiceRequestManualCubit>().serviceId = 3;

            context.read<GetAllTechincalCubit>().serviceId = 3;
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/paid_services/presentation/manager/get_techinical_cubit/get_all_techincal_cubit.dart';
import 'package:splash_app/feature/paid_services/presentation/view/widgets/custom_buttom_sheet.dart';
import '../../manager/service_request_manual_cubit/service_request_manual_cubit.dart';
import 'choise_amount.dart';
import 'custom_radio_list_tile_list_view_builder.dart';
import 'request_button.dart';

class TairCarBodyView extends StatelessWidget {
  TairCarBodyView({super.key});

  final List<Map<String, String>> options = [
    {
      'title': 'Small Cars',
      'description': ' 13 to 16 inches (e.g., 185/65R15)',
      'price': '2500'
    },
    {
      'title': 'Sedans and Hatchbacks',
      'description': ' 15 to 18 inches (e.g., 205/55R16)',
      'price': '3000'
    },
    {
      'title': 'SUVs and Trucks',
      'description': ' 17 to 22 inches (e.g., 265/70R17)',
      'price': '6000'
    },
    {
      'title': 'Sports Cars',
      'description':
          ' 18 to 20 inches with low-profile tires (e.g., 225/40R18)',
      'price': '4500'
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
          selectedOption: "Small Cars",
        ),
        const ChoiseAmount(),
        SizedBox(
          height: context.screenHeight * .2,
        ),
        RequesButton(
          onTap: () {
            context.read<ServiceRequestCubit>().serviceId = 2;

            context.read<GetAllTechincalCubit>().serviceId = 2;
                     cusomBottomSheet(context1: context);
 },
        ),
        SizedBox(
          height: AppHeight.h30,
        )
      ],
    );
  }
}

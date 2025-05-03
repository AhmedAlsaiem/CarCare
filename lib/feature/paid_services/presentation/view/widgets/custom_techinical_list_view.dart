import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/my_car/presebtation/widgets/custom_car_item_skeltonizer_loading.dart';
import 'package:splash_app/feature/paid_services/presentation/manager/get_techinical_cubit/get_all_techincal_cubit.dart';
import '../../manager/get_techinical_cubit/get_all_techincal_state.dart';
import '../../manager/service_request_manual_cubit/service_request_manual_cubit.dart';
import '../../manager/service_request_manual_cubit/service_request_manual_state.dart';
import 'custom_technical_item.dart';

class CustomTechnicalItemListView extends StatelessWidget {
  const CustomTechnicalItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ServiceRequestCubit, ServiceRequestState>(
        listener: (context, state) {
          if (state is ServiceRequestManualSucessState) {
            NavigatorManager.pushName(
                context: context, route: AppRoutes.cheeckOut);
          } else if (state is ServiceRequestUpdateSucessState) {
            NavigatorManager.pushName(
                context: context, route: AppRoutes.cheeckOut);
          } else if (state is ServiceRequestIsLoadinState) {}
        },
        child: Column(children: [
          const SizedBox(height: 20),
          SizedBox(
            height: context.screenHeight * 0.76,
            child: BlocBuilder<GetAllTechincalCubit, GetAllTechincalState>(
                builder: (context, state) {
              if (state is GetAllTechinicalSucessState) {
                return state.techinicalList.isEmpty
                    ? Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: AppSize.s16),
                        child: ListView.builder(
                          itemCount: state.techinicalList.length,
                          itemBuilder: (context, index) {
                            return CustomtechincalItem(
                              techincal: state.techinicalList[index],
                            );
                          },
                        ),
                      )
                    : Center(
                        child: Text(
                          'No Techincal Found !',
                          style: StylesManager.textStyleRegular14
                              .copyWith(color: ColorsManager.black),
                        ),
                      );
              } else if (state is GetAllTechinicalFailedState) {
                return Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Center(
                        child: Text(
                          state.errorMessage.errorMessage,
                          style: StylesManager.textStyleRegular14
                              .copyWith(color: ColorsManager.black),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const CustomCarItemSkeltonizerLoading();
              }
            }),
          ),
        ]));
  }
}

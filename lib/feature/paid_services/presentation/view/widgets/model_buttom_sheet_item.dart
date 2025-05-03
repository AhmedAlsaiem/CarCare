import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/assets_manager.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_circular_progress_indector.dart';
import 'package:splash_app/feature/paid_services/presentation/manager/service_request_manual_cubit/service_request_manual_state.dart';

import '../../manager/service_request_manual_cubit/service_request_manual_cubit.dart';

class ModalBottomSheetItem extends StatelessWidget {
  const ModalBottomSheetItem({super.key, required this.context1});
  final BuildContext context1;
  @override
  Widget build(BuildContext context) {
    int selectedValue = BlocProvider.of<ServiceRequestCubit>(context).orderType;
    return Padding(
      padding: const EdgeInsets.all(AppSize.s20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Select type or order',
            style: StylesManager.styleBold18,
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 200,
            child: BlocBuilder<ServiceRequestCubit, ServiceRequestState>(
              bloc: ServiceRequestCubit(),
              builder: (context, state) {
                if (state is ServiceRequestIsLoadinState) {
                  return const CustomCircularProgressIndicator();
                } else if (state is ServiceRequestManualSucessState) {
                  if (selectedValue == 1) {
                    NavigatorManager.pushName(
                        context: context, route: AppRoutes.cheeckOut);
                    return Container();
                  } else {
                    return Container();
                  }
                } else if (state is ServiceRequestFailedState) {
                  return Center(
                    child: Text(
                      state.error.errorMessage,
                      style: StylesManager.textStyleRegular14,
                    ),
                  );
                } else {
                  return ListView(
                    children: [
                      'Automatic',
                      'Manual',
                    ].map((String value) {
                      return SizedBox(
                        height: 100,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 40,
                            backgroundColor: ColorsManager.babyBlue,
                            child: SvgPicture.asset(
                              colorFilter: const ColorFilter.mode(
                                ColorsManager.mainColor,
                                BlendMode.srcIn,
                              ),
                              alignment: Alignment.center,
                              height: AppSize.s34,
                              width: AppSize.s34,
                              fit: BoxFit.cover,
                              value == 'Automatic'
                                  ? AssetsManager.moreCircle
                                  : AssetsManager.categoryCircle,
                            ),
                          ),
                          title: Text(
                            value,
                            style: StylesManager.textStyleRegular17
                                .copyWith(color: ColorsManager.black),
                          ),
                          onTap: () {
                            if (value == 'Automatic') {
                              BlocProvider.of<ServiceRequestCubit>(context)
                                  .handleAllRequestManualFunctions(
                                      requestType: 1);
                              BlocProvider.of<ServiceRequestCubit>(context)
                                  .orderType = 1;
                            } else if (value == 'Manual') {
                              BlocProvider.of<ServiceRequestCubit>(context)
                                  .orderType = 0;

                              Navigator.pop(context);
                              NavigatorManager.pushName(
                                  context: context,
                                  route: AppRoutes.selectTechincalView);
                            }
                          },
                        ),
                      );
                    }).toList(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

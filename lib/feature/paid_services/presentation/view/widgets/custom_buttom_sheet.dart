import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_circular_progress_indector.dart';
import 'package:splash_app/feature/paid_services/presentation/manager/service_request_manual_cubit/service_request_manual_cubit.dart';
import 'package:splash_app/feature/paid_services/presentation/manager/service_request_manual_cubit/service_request_manual_state.dart';
import 'package:splash_app/feature/paid_services/presentation/view/widgets/model_buttom_sheet_item.dart';

void cusomBottomSheet({required BuildContext context1}) {
  int selectedValue = BlocProvider.of<ServiceRequestCubit>(context1).orderType;
  showModalBottomSheet(
    isScrollControlled: false,
    context: context1,
    builder: (BuildContext context) {
      return BlocProvider(
        create: (context1) => ServiceRequestCubit(),
        child: BlocBuilder<ServiceRequestCubit, ServiceRequestState>(
          builder: (context, state) {
            if (state is ServiceRequestIsLoadinState) {
              return const CustomCircularProgressIndicator();
            } else if (state is ServiceRequestManualSucessState) {

              if (selectedValue == 1) {
                return const CustomNaviagtorContainer();
              }
            } else if (state is ServiceRequestFailedState) {
              return Center(
                child: Text(
                  state.error.errorMessage,
                  style: StylesManager.textStyleRegular14
                      .copyWith(color: ColorsManager.black),
                ),
              );
            } else if (state is ServiceRequestInatialState) {
              return ModalBottomSheetItem(context1: context1);
            } else {

              return Container();
            }
            return Container();
          },
        ),
      );
    },
  );
}

class CustomNaviagtorContainer extends StatefulWidget {
  const CustomNaviagtorContainer({super.key});

  @override
  State<CustomNaviagtorContainer> createState() =>
      _CustomNaviagtorContainerState();
}

class _CustomNaviagtorContainerState extends State<CustomNaviagtorContainer> {
  @override
  void initState() {
    super.initState();

    // نؤجل التنقل لما بعد بناء أول إطار للشاشة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 1), () {
        if (mounted) {
          NavigatorManager.pushWithReplacement(
              context: context, route: AppRoutes.cheeckOut);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const CustomCircularProgressIndicator();
  }
}

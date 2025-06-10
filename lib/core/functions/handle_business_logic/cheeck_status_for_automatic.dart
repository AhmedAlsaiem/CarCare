// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/checkout/data/repos/checkout_repo_impl.dart';
import 'package:splash_app/feature/checkout/presentation/views/widgets/show_confirmation_order_dialog.dart';
import 'package:splash_app/feature/paid_services/presentation/manager/service_request_manual_cubit/service_request_manual_cubit.dart';

import '../../../feature/checkout/presentation/manger/cubit/payment_cubit.dart';
import '../../../feature/checkout/presentation/views/widgets/payment_methods_bottom_sheet.dart';

Future<void> checkStatusForAutomaticMinutes(BuildContext context) async {
  bool endFunction = false;
  int id = ServiceRequestCubit.requestEntity!.id.toInt();
  var startTime = DateTime.now();
  const durationLimit = Duration(minutes: 25);
  const delayInterval = Duration(seconds: 30);

  while (DateTime.now().difference(startTime) < durationLimit) {
    String status = await ServiceRequestCubit().getOrderSatus(id: id);

    if (status == StringsManager.cancled) {
      showConfirmationOrderDialog(
        context: context,
        title: 'your request is cancled',
        desc: StringsManager.techinicalNotAceptOrder,
        snackbarText: StringsManager.deleteSuccessfully,
        onConfirm: () {
          NavigatorManager.pushWithReplacement(
              context: context, route: AppRoutes.homeView);
        },
        onCancle: () {
          ServiceRequestCubit().deletePendingOrder(id: id);
          NavigatorManager.pushWithReplacement(
              context: context, route: AppRoutes.homeView);
        },
      );
      return;
    } else if (status == StringsManager.inProgress) {
      endFunction = true;
      showModalBottomSheet(
          context: context,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          builder: (context) {
            return BlocProvider(
              create: (context) => PaymentCubit(CheckoutRepoImpl()),
              child: const PaymentMethodsBottomSheet(),
            );
          });
      return;
    } else if (status == StringsManager.pending) {
    }

    await Future.delayed(delayInterval);
  }
  showConfirmationOrderDialog(
    context: context,
    title: 'Your order is cancled',
    desc: StringsManager.techinicalNotAceptOrder,
    snackbarText: StringsManager.deleteSuccessfully,
    onConfirm: () {
      NavigatorManager.pushWithReplacement(
          context: context, route: AppRoutes.homeView);
    },
    onCancle: () {
      ServiceRequestCubit().deletePendingOrder(id: id);
      NavigatorManager.pushWithReplacement(
          context: context, route: AppRoutes.homeView);
    },
  );
  if (endFunction == true) {
    return;
  }
}

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/checkout/data/repos/checkout_repo_impl.dart';
import 'package:splash_app/feature/checkout/presentation/views/widgets/show_confirmation_order_dialog.dart';
import 'package:splash_app/feature/paid_services/presentation/manager/service_request_manual_cubit/service_request_manual_cubit.dart';

import '../../../feature/checkout/presentation/manger/cubit/payment_cubit.dart';
import '../../../feature/checkout/presentation/views/widgets/payment_methods_bottom_sheet.dart';

Future<void> checkStatusFor5Minutes(BuildContext context) async {
  bool endFunction = false;
  int id = ServiceRequestCubit.requestEntity!.id.toInt();
  var startTime = DateTime.now();
  const durationLimit = Duration(minutes: 5);
  const delayInterval = Duration(seconds: 30);

  while (DateTime.now().difference(startTime) < durationLimit) {
    String status = await BlocProvider.of<ServiceRequestCubit>(context)
        .getOrderSatus(id: id);

    if (status == StringsManager.cancled) {
      showConfirmationOrderDialog(
        context: context,
        title: StringsManager.updateTechincal,
        desc: StringsManager.techinicalNotAceptOrder,
        snackbarText: StringsManager.deleteSuccessfully,
        onConfirm: () {
          NavigatorManager.pop(context: context);
        },
        onCancle: () {
          ServiceRequestCubit().deletePendingOrder(id: id);
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
    if (endFunction == true) {
      return;
    }
    await Future.delayed(delayInterval);
  }
  showConfirmationOrderDialog(
    context: context,
    title: StringsManager.updateTechincal,
    desc: StringsManager.techinicalNotAceptOrder,
    snackbarText: StringsManager.deleteSuccessfully,
    onConfirm: () {
      NavigatorManager.pop(context: context);
    },
    onCancle: () {
      ServiceRequestCubit().deletePendingOrder(id: id);
    },
  );
}

Future<String> getStatus() async {
  await Future.delayed(const Duration(milliseconds: 500));
  return 'pending';
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/dio_api.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/checkout/data/repos/checkout_repo_impl.dart';
import 'package:splash_app/feature/checkout/presentation/views/widgets/show_confirmation_order_dialog.dart';
import 'package:splash_app/feature/paid_services/presentation/manager/service_request_manual_cubit/service_request_manual_cubit.dart'
    show ServiceRequestManualCubit;

import '../../../feature/checkout/presentation/manger/cubit/payment_cubit.dart';
import '../../../feature/checkout/presentation/views/widgets/payment_methods_bottom_sheet.dart';

Future<void> checkStatusFor5Minutes(BuildContext context) async {
  ApiConsumer api = DioConsumer(dio: Dio());
  bool endFunction = false;
  int id = ServiceRequestManualCubit.requestEntity!.id.toInt();
  var startTime = DateTime.now();
  const durationLimit = Duration(minutes: 5);
  const delayInterval = Duration(seconds: 30);

  while (DateTime.now().difference(startTime) < durationLimit) {
    Map<String, dynamic> data;
    data = await api.get('/ServiceRequest/CheckStatus/$id');
    String status = data['status'];
    print('Current status: $status');

    if (status == 'Canceled') {
      print('Status is canceled, exiting early.');
      showConfirmationOrderDialog(
        context: context,
        title: StringsManager.deleteCar,
        desc: StringsManager.areYouSureYouWantToDeleteCar,
        snackbarText: StringsManager.deleteSuccessfully,
        onConfirm: () {},
        onCancle: () {},
      );
      return;
    } else if (status == 'InProgress') {
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
      print('Status is in progress, keep checking...');
      return;
    } else if (status == 'pending') {
      print('Status is neither pending, canceled, nor in progress. Exiting.');
      return;
    }

    await Future.delayed(delayInterval);
  }
  showConfirmationOrderDialog(
    onCancle: () {},
    context: context,
    title: 'Edit Order',
    desc: StringsManager.areYouSureYouWantToDeleteCar,
    snackbarText: StringsManager.deleteSuccessfully,
    onConfirm: () {},
  );
  if (endFunction == true) {
    return;
  }
}

Future<String> getStatus() async {
  await Future.delayed(const Duration(milliseconds: 500));
  return 'pending';
}

import 'package:flutter/material.dart';
import 'package:splash_app/feature/authentaction/presentation/view/custom_show_snack_bar.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_circular_progress_indector.dart';
import 'package:splash_app/feature/technical/technical_home/presentation/manger/order_cubit/order_state.dart';

void orderHandleState(OrderState state, BuildContext context) {
  // String? type = CacheHelper().getDataString(key: ApiKey.type);

  if (state is IsLoadingOrderState) {
    const CustomCircularProgressIndicator();
  } else if (state is FaliureOrderState) {
    customShowSnackBar(context, state.errorMessage);
  } else if (state is SuccessOrderState) {
    customShowSnackBar(context, state.successMessage!);
  }
}

import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/service_provider_cubit/service_provider_state.dart';
import 'package:splash_app/feature/authentaction/presentation/view/custom_show_snack_bar.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_circular_progress_indector.dart';

void serviceProviderHandleState(
    ServiceProviderState state, BuildContext context) {
  if (state is IsLoadingServiceProviderState) {
    const CustomCircularProgressIndicator();
  } else if (state is SuccessServiceProviderState) {
    customShowSnackBar(context, state.successMessage!);
    NavigatorManager.pushWithReplacement(
        context: context, route: AppRoutes.otpAcoutVerification);
  } else if (state is FaliureServiceProviderState) {
    print(' asdaaaaaaaaaaaaaaaaaaaaaaaaaaaa${state.errorData.toString()}');

    customShowSnackBar(
        context, state.errorMessage + state.errorData.toString());
  }
}

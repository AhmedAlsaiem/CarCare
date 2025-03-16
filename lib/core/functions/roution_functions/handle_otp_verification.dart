import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/user_cubit/user_state.dart';
import 'package:splash_app/feature/authentaction/presentation/view/custom_show_snack_bar.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_circular_progress_indector.dart';


void handleOtpVerification(
    UserState state, BuildContext context, String? type) {
  if (state is IsLoadingUserState) {
    const CustomCircularProgressIndicator();
  } else if (state is FaliureUserState) {
    customShowSnackBar(context, state.errorMessage);
  } else if (state is SuccessUserState) {
    customShowSnackBar(context, state.successMessage!);

    if (type == 'User') {
      NavigatorManager.pushName(context: context, route: AppRoutes.addcar);
    } else if (type == 'Technical') {

      NavigatorManager.pushWithReplacement(
          context: context, route: AppRoutes.serviceProviderHomeView);
    } else {
      customShowSnackBar(context, state.successMessage!);
    }
  }
}

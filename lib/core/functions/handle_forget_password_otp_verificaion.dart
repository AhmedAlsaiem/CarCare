import 'package:flutter/material.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/user_cubit/user_state.dart';
import 'package:splash_app/feature/authentaction/presentation/view/custom_show_snack_bar.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_circular_progress_indector.dart';

import 'navigation.dart';

void handleForgetPassowrdOtpVerification(
    UserState state, BuildContext context, String? type) {
  if (state is IsLoadingUserState) {
    const CustomCircularProgressIndicator();
  } else if (state is FaliureUserState) {
    customShowSnackBar(context, state.errorMessage);
  } else if (state is SuccessUserState) {
    customShowSnackBar(context, state.successMessage!);

    NavigatorManager.pushWithReplacement(
        context: context, route: AppRoutes.loginView);
    customShowSnackBar(context, state.successMessage!);
  }
}

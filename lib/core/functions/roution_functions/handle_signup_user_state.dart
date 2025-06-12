

  import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/user_cubit/user_state.dart';
import 'package:splash_app/feature/authentaction/presentation/view/custom_show_snack_bar.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_circular_progress_indector.dart';


void signUpHandleState(UserState state, BuildContext context) {
      if (state is IsLoadingUserState) {
      const CustomCircularProgressIndicator();
    } else if (state is SuccessUserState) {
      NavigatorManager.pushName(
          context: context, route: AppRoutes.otpAcoutVerification);
    } else if (state is FaliureUserState) {
      customShowSnackBar(context, state.errorMessage+state.errordata.toString());
    }
  }
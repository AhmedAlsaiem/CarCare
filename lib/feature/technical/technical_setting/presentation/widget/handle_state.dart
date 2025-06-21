
  import 'package:flutter/material.dart';
import 'package:splash_app/feature/authentaction/presentation/view/custom_show_snack_bar.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_circular_progress_indector.dart';
import 'package:splash_app/feature/technical/technical_setting/presentation/manger/update_profile/update_profile_state.dart';



void handleState(
      UpdateProfileState state, BuildContext context) {
    if (state is IsLoadingUpdateProfileState) {
      const CustomCircularProgressIndicator();
    } else if (state is SuccessUpdateProfileState) {
      customShowSnackBar(context, state.successMessage!);
      // NavigatorManager.pushWithReplacement(
      //     context: context, route: AppRoutes.otpAcoutVerification);
    } else if (state is FaliureUpdateProfileState) {
      customShowSnackBar(context, state.errorMessage);
    }
  }

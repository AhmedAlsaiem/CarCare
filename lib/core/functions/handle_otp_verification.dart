import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/helper/cache_helper.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/user_cubit/user_cubit.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/user_cubit/user_state.dart';
import 'package:splash_app/feature/authentaction/presentation/view/custom_show_snack_bar.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_circular_progress_indector.dart';

import 'navigation.dart';

void handleOtpVerification(
    UserState state, BuildContext context, String? type) {
  if (state is IsLoadingUserState) {
    const CustomCircularProgressIndicator();
  } else if (state is FaliureUserState) {
    customShowSnackBar(context, state.errorMessage);
  } else if (state is SuccessUserState) {
    if (type == 'User') {
      print('____________1_________________');
      customShowSnackBar(context, state.successMessage!);
      NavigatorManager.pushName(context: context, route: AppRoutes.homeView);
    } else if (type == 'Technical') {
      print('____________2_________________');

      //! ToDo navigate to service provider home view
      customShowSnackBar(context, state.successMessage!);
      NavigatorManager.pushWithReplacement(
          context: context, route: AppRoutes.serviceProviderHomeView);
    } else {

      customShowSnackBar(context, state.successMessage!);
      BlocProvider.of<UserCubit>(context).resetPassword();
      String? newType = CacheHelper().getData(key: ApiKey.type);
      print(newType);
      if (newType == 'User') {

        customShowSnackBar(context, state.successMessage!);
        NavigatorManager.pushName(context: context, route: AppRoutes.homeView);
      } else if (newType == 'Technical') {

        //! ToDo: navigate to service provider home view
        customShowSnackBar(context, state.successMessage!);
        NavigatorManager.pushWithReplacement(
            context: context, route: AppRoutes.serviceProviderHomeView);
      }
    }
  }
}

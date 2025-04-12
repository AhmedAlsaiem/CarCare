import 'package:flutter/material.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/helper/cache_helper.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/user_cubit/user_state.dart';
import 'package:splash_app/feature/authentaction/presentation/view/custom_show_snack_bar.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_circular_progress_indector.dart';

void loginViewhandleState(UserState state, BuildContext context) {
  String? type = CacheHelper().getDataString(key: ApiKey.type);

  if (state is IsLoadingUserState) {
    const CustomCircularProgressIndicator();
  } else if (state is FaliureUserState) {
    customShowSnackBar(context, state.errorMessage);
  } else if (state is SuccessUserState) {
    if (type == StringsManager.technical) {
      NavigatorManager.pushWithReplacement(
          context: context, route: AppRoutes.technicalHomeView);
    } else {
      NavigatorManager.pushWithReplacement(
          context: context, route: AppRoutes.homeView);
    }
  }
}

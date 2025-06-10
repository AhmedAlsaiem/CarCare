
  import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/helper/cache_helper.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/feature/add_car/presentation/manager/cubit/car_state.dart';
import 'package:splash_app/feature/authentaction/presentation/view/custom_show_snack_bar.dart';

import '../../api/end_point.dart';

void handleAddCarState(CarState state, BuildContext context) {
     CacheHelper().saveData(key: ApiKey.fristCare,value: ApiKey.fristCare);
     if (state is SuccessCarState) {
      NavigatorManager.pushWithReplacement(
          context: context, route: AppRoutes.homeView);
    } else if (state is FaliureCarState) {
      customShowSnackBar(context, state.errorMessage);
    }
  }
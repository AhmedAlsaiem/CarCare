import 'package:flutter/material.dart';
import 'package:splash_app/feature/authentaction/presentation/view/custom_show_snack_bar.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_circular_progress_indector.dart';
import 'package:splash_app/feature/feadback_app/presentation/manger/create_feadback_cubit/create_feadback_state.dart';

void feadbackHandleState(FeadbackState state, BuildContext context) {
 // String? type = CacheHelper().getDataString(key: ApiKey.type);

  if (state is IsLoadingFeadbackState) {
    const CustomCircularProgressIndicator();
  } else if (state is FaliureFeadbackState) {
    customShowSnackBar(context, state.errorMessage);
  } else if (state is SuccessFeadbackState) {
    customShowSnackBar(context, 'you are rating sucess');
   
  }
}

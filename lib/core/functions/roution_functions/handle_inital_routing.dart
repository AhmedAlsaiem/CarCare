import 'package:flutter/material.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/helper/cache_helper.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/string_manager.dart';

Future<String> initalRoute(BuildContext context) async {
  bool? appState = CacheHelper().getData(key: StringsManager.appState);
  String? token = CacheHelper().getDataString(key: ApiKey.token);
  String? type = CacheHelper().getDataString(key: ApiKey.type);
  String? verify =
      CacheHelper().getDataString(key: StringsManager.verifyYourAcount);

  if (appState == true && token != null || verify != null) {
    if (type == StringsManager.technical) {
      //   BlocBuilder<LocationCubit, LocationState>(builder: (context, state) {
//         if (state is IsLoadingLocationState) {
//           const CustomCircularProgressIndicator();
//         }else if(state is FaliureLocationState){
//           customShowSnackBar(context, state.errorMessage);
//         }else if(state is SuccessLocationState){
//               tecLocation=  await CurrentLocation().getCurrentLocation();
//         BlocProvider.of<LocationCubit>(context).setLocation(id: CacheHelper().getDataString(key: ApiKey.userId)!, latitude: tecLocation!.latitude, longitude: tecLocation.longitude);
//         }
// return SizedBox();
//       });


      return AppRoutes.technicalHomeView;
    } else {
      return AppRoutes.homeView;
    }
  } else if (appState == null) {
    return AppRoutes.onboardingView;
  } else {
    return AppRoutes.loginView;
  }
}

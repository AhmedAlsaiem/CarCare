import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/helper/cache_helper.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/string_manager.dart';

String initalRoute() {
  bool? appState = CacheHelper().getData(key: StringsManager.appState);
  String? token = CacheHelper().getData(key: ApiKey.token);

  String? type = CacheHelper().getData(key: ApiKey.type);

  dynamic verify =
      CacheHelper().getData(key: StringsManager.verifyYourAcount);

  if (appState == true && token != null || verify != null) {
    if (type == StringsManager.technical) {
      return AppRoutes.serviceProviderHomeView;
    } else {
      return AppRoutes.homeView;
    }
  } else if (appState == null) {
    return AppRoutes.onboardingView;
  } else {
    return AppRoutes.loginView;
  }
}

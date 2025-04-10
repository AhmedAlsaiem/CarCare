import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/functions/transitions/page_route_builder_method.dart';
import 'package:splash_app/core/helper/cache_helper.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/add_car/presentation/manager/cubit/car_cubit.dart';
import 'package:splash_app/feature/add_car/presentation/view/add_car.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/get_all_services_cubit/get_all_services_cubit.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/user_cubit/user_cubit.dart';
import 'package:splash_app/feature/authentaction/presentation/view/choose_acount_type.dart';
import 'package:splash_app/feature/authentaction/presentation/view/forget_password_view.dart';
import 'package:splash_app/feature/authentaction/presentation/view/login_view.dart';
import 'package:splash_app/feature/authentaction/presentation/view/otp_acount_verification.dart';
import 'package:splash_app/feature/authentaction/presentation/view/service_provider_sign_up_view.dart';
import 'package:splash_app/feature/authentaction/presentation/view/service_type.dart';
import 'package:splash_app/feature/authentaction/presentation/view/user_signup.dart';
import 'package:splash_app/feature/home_view/presentation/manager/cubits/bottom_navigation_bar_cubit.dart';
import 'package:splash_app/feature/home_view/presentation/views/parking_car_view.dart';
import 'package:splash_app/feature/paid_services/presentation/view/widgets/mecanical_view_body.dart';
import 'package:splash_app/feature/home_view/presentation/views/washing_car_view.dart';
import 'package:splash_app/feature/map/map_view.dart';
import 'package:splash_app/feature/onboarding/presentation/view/onboarding_view.dart';
import 'package:splash_app/feature/paid_services/presentation/view/batteries_car_view.dart';
import 'package:splash_app/feature/paid_services/presentation/view/fuel_car_view.dart';
import 'package:splash_app/feature/paid_services/presentation/view/mechnical_car_view.dart';
import 'package:splash_app/feature/paid_services/presentation/view/oil_car_view.dart';
import 'package:splash_app/feature/paid_services/presentation/view/tire_car_view.dart';
import 'package:splash_app/feature/paid_services/presentation/view/winch_car_view.dart';
import 'package:splash_app/feature/service_provider_home/presentation/view/service_provider_home_view.dart';
import 'package:splash_app/feature/setting/presentation/views/rating_view.dart';
import 'package:splash_app/feature/user_profile/presentation/manager/cubit/change_profile_ListTile_to_text_form_field_cubit.dart/change_profile_field_cubit.dart';
import 'package:splash_app/feature/user_profile/presentation/manager/cubit/user_Profile_cubit/user_profile_cubit.dart';
import 'package:splash_app/feature/user_profile/presentation/view/user_profile_view.dart';

import '../../feature/authentaction/presentation/manager/service_provider_cubit/service_provider_cubit.dart';
import '../../feature/authentaction/presentation/view/verify_acount.dart';
import '../../feature/home_view/presentation/views/home_view.dart';

class AppRouter {
  bool? appState =
      CacheHelper.sharedPreferences.getBool(StringsManager.appState);
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onboardingView:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const OnboardingView(),
        );
      case AppRoutes.addcar:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => CarCubit(),
            child: const AddCar(),
          ),
        );

      case AppRoutes.forGetPassword:
        return pageRouteBuilderMethod(
            pageBuilder: (context, animation, secondaryAnimation) {
          return BlocProvider(
            create: (context) => UserCubit(),
            child: const ForgetPasswordView(),
          );
        });

      case AppRoutes.loginView:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => UserCubit(),
            child: const LoginView(),
          ),
        );
      case AppRoutes.chooseAcountType:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const ChooseAcountType(),
        );
      case AppRoutes.verifyAcount:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => UserCubit(),
            child: const VerifyAcountView(),
          ),
        );

      case AppRoutes.userSginUpView:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => UserCubit(),
            child: const UserSignUPView(),
          ),
        );
      case AppRoutes.serviceProviderSignUpView:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => ServiceProviderCubit(),
            child: const ServiceProviderSignUpView(),
          ),
        );
      case AppRoutes.otpAcoutVerification:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) =>
              MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => UserCubit(),
              ),
            ],
            child: const OtpAcountVerification(),
          ),
        );
      case AppRoutes.homeView:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) =>
              MultiBlocProvider(providers: [
            BlocProvider(create: (context) => BottomNavigationIndeCubit()),
            BlocProvider(create: (context) => GetAllServicesCubit()),
            BlocProvider(create: (context) => CarCubit())
          ], child: const HomeView()),
        );
      case AppRoutes.serviceTypeView:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => GetAllServicesCubit(),
            child: const ServiceTypeView(),
          ),
        );
      case AppRoutes.serviceProviderHomeView:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => GetAllServicesCubit(),
            child: const ServiceProviderHomeView(),
          ),
        );
      case AppRoutes.tireCarView:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const TireCarView(),
        );
      case AppRoutes.fuelCarView:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const FuelCarView(),
        );
      case AppRoutes.batteriesCarView:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const BatteriesCarView(),
        );
      case AppRoutes.wichCarView:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const WinchCarView(),
        );
      case AppRoutes.oilCarView:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const OilCarView(),
        );
      case AppRoutes.washingCarView:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const WashingCarView(),
        );
      case AppRoutes.parkingCarView:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const ParkingCarView(),
        );
      case AppRoutes.mechanicCarView:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MechnicalCarView(),
        );
      case AppRoutes.recomendation:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MecanicalViewBody(),
        );
      case AppRoutes.ratingView:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const RatingView(),
        );
      case AppRoutes.userPofileView:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) =>
              MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => ChangeProfileFieldCubit()),
              BlocProvider(create: (context) => UserProfileCubit()),
            ],
            child: const UserProfileView(),
          ),
        );
      case AppRoutes.mapView:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MapView(
            nameOfServce: 'parking',
          ),
        );

      default:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const Scaffold(),
        );
    }
  }
}

abstract class AppRoutes {
  static const String onboardingView = '/';
  static const String homeView = '/homeView';
  static const String addcar = '/addcar';
  static const String loginView = '/loginView';
  static const String ratingView = '/ratingView';
  static const String setting = '/setting';
  static const String userSginUpView = '/userSignUpView';
  static const String serviceProviderSignUpView = '/adminSignUPView';
  static const String chooseAcountType = '/chooseAcountType';
  static const String forGetPassword = '/forGetPassword';
  static const String otpAcoutVerification = '/otpAcountVerification';
  static const String serviceTypeView = '/serviceTypeView';
  static const String serviceProviderHomeView = '/serviceProviderHomeView';
  static const String verifyAcount = '/verifyAcount';
  static const String tireCarView = '/tireCarView';
  static const String fuelCarView = '/fuelCarView';
  static const String batteriesCarView = '/batteriesCarView';
  static const String wichCarView = '/wichCarView';
  static const String oilCarView = '/oilCarView';
  static const String washingCarView = '/washingCarView';
  static const String parkingCarView = '/parkingCarView';
  static const String mechanicCarView = '/mechanicCarView';
  static const String recomendation = '/recomendation';
  static const String currentLocation = '/currentLocation';
  static const String mapView = '/mapView';
  static const String userPofileView = '/userProfileView';
}

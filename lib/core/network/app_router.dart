import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/helper/cache_helper.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/add_car/presentation/manager/cubit/car_cubit.dart';
import 'package:splash_app/feature/add_car/presentation/view/add_car.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/get_all_services_cubit/get_all_services_cubit.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/service_provider_cubit/service_provider_cubit.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/user_cubit/user_cubit.dart';
import 'package:splash_app/feature/authentaction/presentation/view/service_provider_sign_up_view.dart';
import 'package:splash_app/feature/authentaction/presentation/view/forget_password_view.dart';
import 'package:splash_app/feature/authentaction/presentation/view/login_view.dart';
import 'package:splash_app/feature/authentaction/presentation/view/choose_acount_type.dart';
import 'package:splash_app/feature/authentaction/presentation/view/otp_acount_verification.dart';
import 'package:splash_app/feature/authentaction/presentation/view/service_type.dart';
import 'package:splash_app/feature/authentaction/presentation/view/user_signup.dart';
import 'package:splash_app/feature/authentaction/presentation/view/verify_acount.dart';
import 'package:splash_app/feature/home_view/home_view.dart';
import 'package:splash_app/feature/home_view/presentation/cubits/bottom_navigation_bar_cubit.dart';
import 'package:splash_app/feature/onboarding/presentation/view/onboarding_view.dart';
import 'package:splash_app/feature/service_provider_home/presentation/view/service_provider_home_view.dart';
import 'package:splash_app/feature/home_view/presentation/views/batteries_car_view.dart';
import 'package:splash_app/feature/home_view/presentation/views/fuel_car_view.dart';
import 'package:splash_app/feature/home_view/presentation/views/mechnical_car_view.dart';
import 'package:splash_app/feature/home_view/presentation/views/oil_car_view.dart';
import 'package:splash_app/feature/home_view/presentation/views/parking_car_view.dart';
import 'package:splash_app/feature/home_view/presentation/views/recomndation_view.dart';
import 'package:splash_app/feature/home_view/presentation/views/tire_car_view.dart';
import 'package:splash_app/feature/home_view/presentation/views/washing_car_view.dart';
import 'package:splash_app/feature/home_view/presentation/views/winch_car_view.dart';
import 'package:splash_app/feature/setting/presentation/views/rating_view.dart';
import 'package:splash_app/feature/setting/setting_view.dart';

class AppRouter {
  bool? appState =
      CacheHelper.sharedPreferences.getBool(StringsManager.appState);
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onboardingView:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
        );
      case AppRoutes.addcar:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CarCubit(),
            child: const AddCar(),
          ),
        );
      case AppRoutes.seting:
        return MaterialPageRoute(
          builder: (_) => const SettingView(),
        );

      case AppRoutes.forGetPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => UserCubit(),
            child: const ForgetPasswordView(),
          ),
        );

      case AppRoutes.loginView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => UserCubit(),
            child: const LoginView(),
          ),
        );
      case AppRoutes.chooseAcountType:
        return MaterialPageRoute(
          builder: (_) => const ChooseAcountType(),
        );
      case AppRoutes.verifyAcount:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => UserCubit(),
            child: const VerifyAcountView(),
          ),
        );
      case AppRoutes.userSginUpView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => UserCubit(),
            child: const UserSignUPView(),
          ),
        );
      case AppRoutes.serviceProviderSignUpView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ServiceProviderCubit(),
            child: const ServiceProviderSignUpView(),
          ),
        );
      case AppRoutes.otpAcoutVerification:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => UserCubit(),
              ),
              // BlocProvider(
              //   create: (context) => SubjectBloc(),
              // ),
            ],
            child: const OtpAcountVerification(),
          ),
        );
      case AppRoutes.homeView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => BottomNavigationIndeCubit(),
            child:const  ZommDrawerCalss(),
          ),
        );
      case AppRoutes.serviceTypeView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => GetAllServicesCubit(),
            child: const ServiceTypeView(),
          ),
        );
      case AppRoutes.serviceProviderHomeView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => GetAllServicesCubit(),
            child: const ServiceProviderHomeView(),
          ),
        );
      case AppRoutes.tireCarView:
        return MaterialPageRoute(
          builder: (_) => const TireCarView(),
        );
      case AppRoutes.fuelCarView:
        return MaterialPageRoute(
          builder: (_) => const FuelCarView(),
        );
      case AppRoutes.batteriesCarView:
        return MaterialPageRoute(
          builder: (_) => const BatteriesCarView(),
        );
      case AppRoutes.wichCarView:
        return MaterialPageRoute(
          builder: (_) => const WinchCarView(),
        );
      case AppRoutes.oilCarView:
        return MaterialPageRoute(
          builder: (_) => const OilCarView(),
        );
      case AppRoutes.washingCarView:
        return MaterialPageRoute(
          builder: (_) => const WashingCarView(),
        );
      case AppRoutes.parkingCarView:
        return MaterialPageRoute(
          builder: (_) => const ParkingCarView(),
        );
      case AppRoutes.mechanicCarView:
        return MaterialPageRoute(
          builder: (_) => const MechnicalCarView(),
        );
      case AppRoutes.recomendation:
        return MaterialPageRoute(
          builder: (_) => const RecomndationView(),
        );
      case AppRoutes.ratingView:
        return MaterialPageRoute(
          builder: (_) => const RatingView(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(),
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
  static const String seting = '/setting';

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
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/helper/cache_helper.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/service_provider_cubit/service_Provider_cubit.dart';
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
import 'package:splash_app/feature/onboarding/presentation/view/onboarding_view.dart';

class AppRouter {
  bool? appState =
      CacheHelper.sharedPreferences.getBool(StringsManager.appState);
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onboardingView:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
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
          builder: (_) => const VerifyAcountView(),
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
          builder: (_) => const HomeView(),
        );
      case AppRoutes.serviceTypeView:
        return MaterialPageRoute(
          builder: (_) => const ServiceTypeView(),
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
  static const String loginView = '/loginView';
  static const String userSginUpView = '/userSignUpView';
  static const String serviceProviderSignUpView = '/adminSignUPView';
  static const String chooseAcountType = '/chooseAcountType';
  static const String forGetPassword = '/forGetPassword';
  static const String otpAcoutVerification = '/otpAcountVerification';
  static const String serviceTypeView = '/serviceTypeView';
  static const String verifyAcount = '/verifyAcount';
  static const String homeView = '/homeView';
}

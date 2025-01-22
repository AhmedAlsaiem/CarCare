import 'package:flutter/material.dart';
import 'package:splash_app/feature/authentaction/presentation/view/admin_signup.dart';
import 'package:splash_app/feature/authentaction/presentation/view/forget_password_view.dart';
import 'package:splash_app/feature/authentaction/presentation/view/login_view.dart';
import 'package:splash_app/feature/authentaction/presentation/view/choose_acount_type.dart';
import 'package:splash_app/feature/authentaction/presentation/view/user_signup.dart';
import 'package:splash_app/feature/authentaction/presentation/view/verify_acount.dart';
import 'package:splash_app/feature/onboarding/presentation/view/onboarding_view.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onboardingView:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
        );
      case AppRoutes.forGetPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgetPasswordView(),
        );
      case AppRoutes.loginView:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
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
          builder: (_) => const UserSignup(),
        );
      case AppRoutes.adminSignUpView:
        return MaterialPageRoute(
          builder: (_) => const AdminSignup(),
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
  static const String adminSignUpView = '/adminSignUPView';
  static const String chooseAcountType = '/chooseAcountType';
  static const String forGetPassword = '/forGetPassword';
  static const String verifyAcount = '/verifyAcount';
}

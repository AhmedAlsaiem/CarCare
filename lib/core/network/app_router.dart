import 'package:flutter/material.dart';
import 'package:splash_app/feature/authentaction/presentation/view/forget_password_view.dart';
import 'package:splash_app/feature/authentaction/presentation/view/login_view.dart';
import 'package:splash_app/feature/authentaction/presentation/view/signup_view.dart';
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
      case AppRoutes.signUpView:
        return MaterialPageRoute(
          builder: (_) => const SignUpView(),
        );
      case AppRoutes.verifyAcount:
        return MaterialPageRoute(
          builder: (_) => const VerifyAcountView(),
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
  static const String signUpView = '/signUpView';
  static const String forGetPassword = '/forGetPassword';
  static const String verifyAcount = '/verifyAcount';
}

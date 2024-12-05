
import 'package:flutter/material.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case AppRoutes.splashView:
      //   return MaterialPageRoute(
      //     builder: (_) => const SplashView(),
      //   );
      // case AppRoutes.onboardingView:
      //   return MaterialPageRoute(
      //     builder: (_) => const OnBoardingView(),
      //   );
      // case AppRoutes.forGetPassword:
      //   return MaterialPageRoute(
      //     builder: (_) => const ForgetpasswordView(),
      //   );
      // case AppRoutes.loginView:
      //   return MaterialPageRoute(
      //     builder: (_) => const LoginView(),
      //   );
      // case AppRoutes.signUpView:
      //   return MaterialPageRoute(
      //     builder: (_) => SignUpView(),
      //   );
      // case AppRoutes.home:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => HomeBodyCubit(),
      //       child: const HomeView(),
      //     ),
      //   );
      // case AppRoutes.homeDetails:
      //   return MaterialPageRoute(
      //     builder: (_) => const HomeDetails(),
      //   );
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
  static const String home = '/home';
  static const String homeDetails = '/homeDetails';
}

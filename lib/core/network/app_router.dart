
import 'package:flutter/material.dart';
import 'package:splash_app/feature/add_car/add_car.dart';
import 'package:splash_app/feature/authentaction/presentation/view/admin_signup.dart';
import 'package:splash_app/feature/authentaction/presentation/view/forget_password_view.dart';
import 'package:splash_app/feature/authentaction/presentation/view/login_view.dart';
import 'package:splash_app/feature/authentaction/presentation/view/choose_acount_type.dart';
import 'package:splash_app/feature/authentaction/presentation/view/otp_acount_verification.dart';
import 'package:splash_app/feature/authentaction/presentation/view/user_signup.dart';
import 'package:splash_app/feature/authentaction/presentation/view/verify_acount.dart';
import 'package:splash_app/feature/home_view/presentation/views/batteries_car_view.dart';
import 'package:splash_app/feature/home_view/presentation/views/fuel_car_view.dart';
import 'package:splash_app/feature/home_view/presentation/views/mechnical_car_view.dart';
import 'package:splash_app/feature/home_view/presentation/views/oil_car_view.dart';
import 'package:splash_app/feature/home_view/presentation/views/parking_car_view.dart';
import 'package:splash_app/feature/home_view/presentation/views/recomndation_view.dart';
import 'package:splash_app/feature/home_view/presentation/views/tire_car_view.dart';
import 'package:splash_app/feature/home_view/presentation/views/washing_car_view.dart';
import 'package:splash_app/feature/home_view/presentation/views/winch_car_view.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case AppRoutes.onboardingView:
      //   return MaterialPageRoute(
      //     builder: (_) => const OnboardingView(),
      //   );
      case AppRoutes.addcar:
        return MaterialPageRoute(
          builder: (_) => const AddCar(),
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
          builder: (_) => const UserSignUPView(),
        );
      case AppRoutes.adminSignUpView:
        return MaterialPageRoute(
          builder: (_) => const AdminSignup(),
        );
      case AppRoutes.otpAcoutVerification:
        return MaterialPageRoute(
          builder: (_) => const OtpAcountVerification(),
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
      
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(),
        );
    }
  }
}

abstract class AppRoutes {
  static const String addcar = '/';
  // static const String onboardingView = '/';
  static const String loginView = '/loginView';
  static const String userSginUpView = '/userSignUpView';
  static const String adminSignUpView = '/adminSignUPView';
  static const String chooseAcountType = '/chooseAcountType';
  static const String forGetPassword = '/forGetPassword';
  static const String otpAcoutVerification = '/otpAcountVerification';
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

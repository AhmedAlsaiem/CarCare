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
import 'package:splash_app/feature/authentaction/presentation/view/verify_acount.dart';
import 'package:splash_app/feature/feadback_app/presentation/manger/get_app_feadback/get_app_feadback_cubit.dart';
import 'package:splash_app/feature/home_view/presentation/views/home_view.dart';
import 'package:splash_app/feature/checkout/presentation/views/order_details_view.dart';
import 'package:splash_app/feature/contact/presentation/manager/contact_cubit/contact_cubit.dart';
import 'package:splash_app/feature/contact/presentation/views/contact_view.dart';
import 'package:splash_app/feature/home_view/presentation/manager/cubits/bottom_navigation_bar_cubit.dart';
import 'package:splash_app/feature/home_view/presentation/views/parking_car_view.dart';
import 'package:splash_app/feature/paid_services/presentation/manager/get_techinical_cubit/get_all_techincal_cubit.dart';
import 'package:splash_app/feature/paid_services/presentation/manager/service_request_manual_cubit/service_request_manual_cubit.dart';
import 'package:splash_app/feature/paid_services/presentation/view/select_techinacl_view.dart';
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
import 'package:splash_app/feature/feadback_app/presentation/manger/create_feadback_cubit/create_feadback_cubit.dart';
import 'package:splash_app/feature/feadback_app/presentation/views/feadback_view.dart';
import 'package:splash_app/feature/feadback_app/presentation/views/get_app_feadback.dart';
import 'package:splash_app/feature/feadback_app/presentation/views/my_feadback.dart';
import 'package:splash_app/feature/feadback_app/presentation/views/new_feadback.dart';
import 'package:splash_app/feature/feadback_app/presentation/views/update_feadback.dart';
import 'package:splash_app/technical/message/presentation/manger/message_cubit.dart';
import 'package:splash_app/technical/message/presentation/views/message_view.dart';
import 'package:splash_app/technical/technical_home/presentation/manger/location_cubit/location_cubit.dart';
import 'package:splash_app/technical/technical_home/presentation/manger/order_cubit/order_cubit.dart';
import 'package:splash_app/technical/technical_home/presentation/manger/tecnical_state/tecniacl_cubit.dart';
import 'package:splash_app/technical/technical_home/presentation/view/map_view_for_useer.dart';
import 'package:splash_app/technical/technical_home/presentation/view/technical_home_view.dart';
import 'package:splash_app/technical/technical_setting/presentation/manger/tecnical_profile/tecnical_profile_cubit.dart';
import 'package:splash_app/technical/technical_setting/presentation/manger/update_profile/update_profile_cubit.dart';
import 'package:splash_app/technical/technical_setting/presentation/views/profile_tecnical_view.dart';
import 'package:splash_app/technical/technical_setting/presentation/views/update_profile_view.dart';
import 'package:splash_app/feature/user_profile/presentation/manager/cubit/change_profile_ListTile_to_text_form_field_cubit.dart/change_profile_field_cubit.dart';
import 'package:splash_app/feature/user_profile/presentation/manager/cubit/user_Profile_cubit/user_profile_cubit.dart';
import 'package:splash_app/feature/user_profile/presentation/view/user_profile_view.dart';
import '../../feature/authentaction/presentation/manager/service_provider_cubit/service_provider_cubit.dart';

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
            BlocProvider(create: (context) => CarCubit()),
            BlocProvider(create: (context) => ServiceRequestCubit()),
            BlocProvider(create: (context) => ContactCubit()),
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
                MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (context) => GetAllTechincalCubit()),
                    BlocProvider(create: (context) => ServiceRequestCubit()),
                  ],
                  child: const TireCarView(),
                ));
      case AppRoutes.fuelCarView:
        return pageRouteBuilderMethod(
            pageBuilder: (context, animation, secondaryAnimation) =>
                MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (context) => GetAllTechincalCubit()),
                    BlocProvider(create: (context) => ServiceRequestCubit()),
                  ],
                  child: const FuelCarView(),
                ));
      case AppRoutes.batteriesCarView:
        return pageRouteBuilderMethod(
            pageBuilder: (context, animation, secondaryAnimation) =>
                MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (context) => GetAllTechincalCubit()),
                    BlocProvider(create: (context) => ServiceRequestCubit()),
                  ],
                  child: const BatteriesCarView(),
                ));
      case AppRoutes.wichCarView:
        return pageRouteBuilderMethod(
            pageBuilder: (context, animation, secondaryAnimation) =>
                MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (context) => GetAllTechincalCubit()),
                    BlocProvider(create: (context) => ServiceRequestCubit()),
                  ],
                  child: const WinchCarView(),
                ));
      case AppRoutes.oilCarView:
        return pageRouteBuilderMethod(
            pageBuilder: (context, animation, secondaryAnimation) =>
                MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (context) => GetAllTechincalCubit()),
                    BlocProvider(create: (context) => ServiceRequestCubit()),
                  ],
                  child: const OilCarView(),
                ));
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
              MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => ServiceRequestCubit()),
              BlocProvider(create: (context) => GetAllTechincalCubit()),
            ],
            child: const MechnicalCarView(),
          ),
        );
      case AppRoutes.recomendation:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MechnicalCarView(),
        );
      case AppRoutes.ratingView:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const RatingView(),
        );
      case AppRoutes.mapViewWashing:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MapView(
            nameOfServce: 'car_wash',
          ),
        );
      case AppRoutes.mapViewPareking:
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
      case AppRoutes.mapViewFuel:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MapView(
            nameOfServce: 'fuel',
          ),
        );
      case AppRoutes.mapViewMachnical:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MapView(
            nameOfServce: 'car_repair',
          ),
        );
      case AppRoutes.mapViewForUser:
        return MaterialPageRoute(builder: (_) =>  const MapViewForUseer());
// case AppRoutes.mapViewForUser:
//       // Access arguments from settings, not from context
//       final args = settings.arguments as Map<String, dynamic>?;
      
//       return MaterialPageRoute(
//         builder: (context) => MapViewForUserBody(
//           latitude: args?['latitude'] ?? 0.0,
//           longitude: args?['longitude'] ?? 0.0,
//         ),
//       );
      case AppRoutes.feadbackView:
        return MaterialPageRoute(
          builder: (_) => const FeadbackView(),
        );
      // case AppRoutes.profileTechnicalView:
      //   return MaterialPageRoute(
      //     builder: (_) BlocProvider(
      //       create: (context) => TecnicalProfileCubit(),
      //       child: => ProfileTecnicalView(),
      //     ),
      //   );

      case AppRoutes.newFeadback:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => FeadbackCubit(),
            child: const NewFeadback(),
          ),
        );
      case AppRoutes.profileTechnicalView:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => TecnicalProfileCubit(),
                    ),
                    BlocProvider(
                      create: (context) => UpdateProfileCubit(),
                    ),
                  ],
                  child: const ProfileTecnicalView(),
                ));
      case AppRoutes.myFeadback:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => FeadbackCubit(),
            child: const MyFeadback(),
          ),
        );
      case AppRoutes.updateFeadback:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => FeadbackCubit(),
            child: const UpdateFeadback(),
          ),
        );
      case AppRoutes.getappFeadback:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => FeadbackCubit(),
              ),
              BlocProvider(
                create: (context) => GetAppFeadbackCubit(),
              ),
            ],
            child: const GetAppFeadback(),
          ),
        );
      case AppRoutes.messagetecnical:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => MessageCubit(),
            child: const MessageView(),
          ),
        );

      case AppRoutes.updateProfile:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => UpdateProfileCubit(),
                    ),
                    BlocProvider(
                      create: (context) => TecnicalProfileCubit(),
                    ),
                  ],
                  child: const UpdateProfileView(),
                ));
      case AppRoutes.technicalHomeView:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => OrderCubit(),
                    ),
                    // BlocProvider(
                    //   create: (context) => AllOrdersCubit(),
                    // ),
                    BlocProvider(
                      create: (context) => TecniaclCubit(),
                    ),
                    BlocProvider(
                      create: (context) => LocationCubit(),
                    ),
                    BlocProvider(
                      create: (context) => BottomNavigationIndeCubit(),
                    ),
                  ],
                  child: const TechnicalHomeView(),
                ));

      case AppRoutes.cheeckOut:
        return pageRouteBuilderMethod(
            pageBuilder: (context, animation, secondaryAnimation) =>
                BlocProvider(
                  create: (context) => ServiceRequestCubit(),
                  child: const OrderDetailView(),
                ));
      case AppRoutes.selectTechincalView:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) =>
              MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => GetAllTechincalCubit()),
              BlocProvider(create: (context) => ServiceRequestCubit()),
            ],
            child: const SelectTechinaclView(),
          ),
        );
      case AppRoutes.contactView:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) =>
              MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => ContactCubit()),
            ],
            child: const ContactView(),
          ),
        );
      default:
        return pageRouteBuilderMethod(
          pageBuilder: (context, animation, secondaryAnimation) =>
            const  Scaffold(),
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
  static const String mapViewMachnical = '/mapViewMachnical';
  static const String mapViewPareking = '/mapViewPareking';
  static const String mapViewWashing = '/mapViewWashing';
  static const String mapViewFuel = '/mapViewFuel';
  static const String feadbackView = '/feadbackView';

  static const String newFeadback = '/newFeadback';
  static const String myFeadback = '/myFeadback';
  static const String updateFeadback = '/updateFeadback';
  static const String getappFeadback = '/getappFeadback';
  static const String feadbackOpation = '/feadbackOpation';
  static const String technicalHomeView = '/technicalHomeView';
  static const String profileTechnicalView = '/profileTechnicalView';
  static const String updateProfile = '/updateProfile';
  static const String messagetecnical = '/messagetecnical';
  static const String mapViewForUser = '/mapViewForUser';
  static const String selectTechincalView = '/selectTechinicalView';
  static const String contactView = '/contactView';
  static const String mapView = '/mapView';
  static const String userPofileView = '/userProfileView';
  static const String cheeckOut = '/cheeckOut';
}

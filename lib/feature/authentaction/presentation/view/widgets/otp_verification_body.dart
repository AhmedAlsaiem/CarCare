import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/functions/secure_email.dart';
import 'package:splash_app/core/helper/cache_helper.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/user_cubit/user_cubit.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/user_cubit/user_state.dart';
import 'package:splash_app/feature/authentaction/presentation/view/custom_show_snack_bar.dart';
import 'package:splash_app/feature/authentaction/presentation/view/otp_verification_code_section.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_circular_progress_indector.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_logo_auth.dart';

class OtpAcountVerificationBody extends StatelessWidget {
  const OtpAcountVerificationBody({super.key});
  @override
  Widget build(BuildContext context) {
    String? type = CacheHelper().getData(key: ApiKey.type);

    String? email = CacheHelper().getData(key: ApiKey.email);
    String secemail;
    secemail = secureEmail(email: email!);
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is IsLoadingUserState) {
          const CustomCircularProgressIndicator();
        } else if (state is FaliureUserState) {
          print('object');
          customShowSnackBar(context, state.errorMessage);
        } else if (state is SuccessUserState) {
          if (type == 'User') {
            customShowSnackBar(context, state.successMessage!);
            NavigatorManager.pushName(
                context: context, route: AppRoutes.homeView);
          } else {
            // ToDo navigate to service provider home view
          }
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomLogoAuth(
                  title: StringsManager.verificationCode,
                  height: context.screenHeight * 0.22),
              SizedBox(height: AppHeight.h20),
              OtpverifactionCodeSection(secemail: secemail),
            ],
          ),
        );
      },
    );
  }
}

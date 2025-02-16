
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/functions/handle_forget_password_otp_verificaion.dart';
import 'package:splash_app/core/functions/secure_email.dart';
import 'package:splash_app/core/helper/cache_helper.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/user_cubit/user_cubit.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/user_cubit/user_state.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/change_password_otp_verification_code_section.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_logo_auth.dart';

class ChangePasswordOtpVerificationBody extends StatelessWidget {
  const ChangePasswordOtpVerificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    String? type = CacheHelper().getData(key: ApiKey.type);

    String? email = CacheHelper().getData(key: ApiKey.email);
    String secemail;
    secemail = secureEmail(email: email!);

    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        handleForgetPassowrdOtpVerification(state, context, type);
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
              ChangePasswordOtpVerificationCodeSection(secemail: secemail),
            ],
          ),
        );
      },
    );
  }
}

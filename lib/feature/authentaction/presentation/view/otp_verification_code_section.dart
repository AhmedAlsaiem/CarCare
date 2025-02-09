import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/helper/cache_helper.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/widgets/custom_text_button.dart';
import 'package:splash_app/feature/authentaction/presentation/view/otp_verification_code_form_field.dart';

import '../manager/user_cubit/user_cubit.dart';
import 'widgets/custom_secured_email_otp_verification.dart';

class OtpverifactionCodeSection extends StatelessWidget {
  const OtpverifactionCodeSection({
    super.key,
    required this.secemail,
  });

  final String secemail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomotpVerificationSecureTextEmail(secureEmail: secemail),
          SizedBox(height: AppHeight.h20),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const OtpVerifcationCodeFormFields(),
              SizedBox(height: context.screenHeight * 0.3),
              CustomButton(
                  onPressed: () {
                    String? confirmation = CacheHelper.sharedPreferences
                        .getString(ApiKey.confimationCode);
                    if (confirmation == null) {
                      BlocProvider.of<UserCubit>(context).confirmEmail();
                    } else {
                      BlocProvider.of<UserCubit>(context).verfiyEmail();
                    }
                  },
                  bottonName: StringsManager.submmit),
            ],
          ),
          //  Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}

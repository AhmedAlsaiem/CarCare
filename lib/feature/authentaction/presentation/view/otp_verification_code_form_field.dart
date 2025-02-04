
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_otp_field.dart';

import '../manager/user_cubit/user_cubit.dart';

class OtpVerifcationCodeFormFields extends StatelessWidget {
  const OtpVerifcationCodeFormFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<UserCubit>().verifcationCodeKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          CustomOtpfield(controller: context.read<UserCubit>().otp1),
          CustomOtpfield(controller: context.read<UserCubit>().otp2),
          CustomOtpfield(controller: context.read<UserCubit>().otp3),
          CustomOtpfield(controller: context.read<UserCubit>().otp4),
          SizedBox(),
        ],
      ),
    );
  }
}

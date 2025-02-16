import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/user_cubit/user_cubit.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_otp_field.dart';

class ChangePasswordOtpVerificationFormfield extends StatelessWidget {
  const ChangePasswordOtpVerificationFormfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<UserCubit>().verifcationCodeKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          CustomOtpfield(
              controller: context.read<UserCubit>().otpFrogetPassword1),
          CustomOtpfield(
              controller: context.read<UserCubit>().otpFrogetPassword2),
          CustomOtpfield(
              controller: context.read<UserCubit>().otpFrogetPassword3),
          CustomOtpfield(
              controller: context.read<UserCubit>().otpFrogetPassword4),
          const SizedBox(),
        ],
      ),
    );
  }
}

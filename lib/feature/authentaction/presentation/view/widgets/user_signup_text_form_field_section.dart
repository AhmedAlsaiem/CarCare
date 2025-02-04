import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/widgets/custom_text_button.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/user_cubit/user_cubit.dart';
import '../../../../../core/utils/string_manager.dart';
import 'custom_text_form_field.dart';

class UserSignupTextFormFieldSection extends StatelessWidget {
  const UserSignupTextFormFieldSection({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
            controller: context.read<UserCubit>().signUpPhoneNumber,
            textInputType: TextInputType.number,
            label: StringsManager.phoneNumber,
            icon: const Icon(Icons.phone_android_rounded),
            onchange: (value) {}),
        const SizedBox(height: AppSize.s14),
        CustomTextFormField(
            controller: context.read<UserCubit>().signUpEmail,
            label: StringsManager.email,
            icon: const Icon(Icons.email_outlined),
            onchange: (value) {}),
        const SizedBox(height: AppSize.s14),
        CustomTextFormField(
            controller: context.read<UserCubit>().signUpUserName,
            label: StringsManager.userName,
            icon: const Icon(Icons.person_3_outlined),
            onchange: (value) {}),
        const SizedBox(height: AppSize.s14),
        CustomTextFormField(
            controller: context.read<UserCubit>().signUpPassword,
            label: StringsManager.password,
            icon: const Icon(Icons.password),
            onchange: (value) {}),
        const SizedBox(
          height: AppSize.s50,
        ),
        CustomButton(
          bottonName: StringsManager.signUp,
          onPressed: () {
            if (formKey.currentState?.validate() == true) {
              BlocProvider.of<UserCubit>(context).userSignUp();
              //   NavigatorManager.pushName(
              //       context: context, route: AppRoutes.otpAcoutVerification);
            }
          },
        ),
      ],
    );
  }
}

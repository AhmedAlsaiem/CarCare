import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/widgets/custom_text_button.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/user_cubit/user_cubit.dart';
import '../../../../../core/utils/string_manager.dart';
import 'cusom_forget_password_triger_page.dart';
import 'custom_text_form_field.dart';

class LoginTextFromFieldSection extends StatelessWidget {
  const LoginTextFromFieldSection({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
            controller: context.read<UserCubit>().loginPhoneNumber,
            textInputType: TextInputType.number,
            label: StringsManager.phoneNumber,
            icon: const Icon(Icons.phone_android_rounded),
            onchange: (value) {}),
        const SizedBox(
          height: AppSize.s16,
        ),
        CustomTextFormField(
            controller: context.read<UserCubit>().loginPassword,
            label: StringsManager.password,
            icon: const Icon(Icons.password),
            onchange: (value) {}),
        const SizedBox(
          height: AppSize.s10,
        ),
        const CustomForgetPasswordTrigrePage(),
        const SizedBox(
          height: AppSize.s70,
        ),
        CustomButton(
          bottonName: StringsManager.login,
          onPressed: () {
            if (formKey.currentState?.validate() == true) {
              BlocProvider.of<UserCubit>(context).login();
            }
          },
        ),
      ],
    );
  }
}

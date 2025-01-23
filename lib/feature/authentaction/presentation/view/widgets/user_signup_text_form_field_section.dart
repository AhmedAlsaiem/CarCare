import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/widgets/custom_text_button.dart';
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
            textInputType: TextInputType.number,
            label: StringsManager.phoneNumber,
            icon: const Icon(Icons.phone_android_rounded),
            onchange: (value) {}),
        const SizedBox(height: AppSize.s20),
        CustomTextFormField(
            label: StringsManager.userName,
            icon: const Icon(Icons.person_3_outlined),
            onchange: (value) {}),
        const SizedBox(height: AppSize.s20),
        CustomTextFormField(
            label: StringsManager.password,
            icon: const Icon(Icons.password),
            onchange: (value) {}),
        const SizedBox(
          height: AppSize.s80,
        ),
        CustomButton(
          bottonName: StringsManager.signUp,
          onPressed: () {
            if (formKey.currentState?.validate() == true) {}
            NavigatorManager.pushName(
                context: context, route: AppRoutes.otpAcoutVerification);
          },
        ),
      ],
    );
  }
}

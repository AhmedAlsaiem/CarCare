import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/widgets/custom_text_button.dart';
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
            textInputType: TextInputType.number,
            label: StringsManager.phoneNumber,
            icon: const Icon(Icons.phone_android_rounded),
            onchange: (value) {}),
        const SizedBox(
          height: AppSize.s16,
        ),
        CustomTextFormField(
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
            if (formKey.currentState?.validate() == true) {}
          },
        ),
      ],
    );
  }
}

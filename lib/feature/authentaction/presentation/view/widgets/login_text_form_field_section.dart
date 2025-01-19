import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/widgets/custom_text_button.dart';

import '../../../../../core/utils/string_manager.dart';
import 'custom_text_button.dart';
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
          height: AppSize.s20,
        ),
        CustomTextFormField(
            label: StringsManager.password,
            icon: const Icon(Icons.password),
            onchange: (value) {}),
        CustomTextBotton(
          title1: StringsManager.emptyString,
          title2: StringsManager.forgetPassword,
          onPress: () {
            NavigatorManager.pushWithReplacement(
              context: context,
              route: AppRoutes.chooseAcountType,
            );
          },
        ),
        const SizedBox(
          height: AppSize.s100,
        ),
        CustomTextButton(
          onPressed: () {
            if (formKey.currentState?.validate() == true) {}
          },
        ),
      ],
    );
  }
}

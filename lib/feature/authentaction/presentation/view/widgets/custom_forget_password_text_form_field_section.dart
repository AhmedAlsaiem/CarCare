
import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/widgets/custom_text_button.dart';

import 'custom_text_form_field.dart';

class CustomFrogetPasswordTextFromFieldSection extends StatelessWidget {
  const CustomFrogetPasswordTextFromFieldSection({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
          child: Column(
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
                  label: StringsManager.newPassword,
                  icon: const Icon(Icons.password),
                  onchange: (value) {}),
              const SizedBox(
                height: AppSize.s150,
              ),
              CustomButton(
                bottonName: StringsManager.submmit,
                onPressed: () {
                  if (formKey.currentState?.validate() == true) {}
                },
              ),
            ],
          ),
        ));
  }
}

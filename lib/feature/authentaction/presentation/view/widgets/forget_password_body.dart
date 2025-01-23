import 'package:flutter/material.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_logo_auth.dart';
import 'custom_forget_password_text_form_field_section.dart';

// ignore: must_be_immutable
class ForgetPasswordBody extends StatelessWidget {
  ForgetPasswordBody({super.key});
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomLogoAuth(
            title: StringsManager.forgetPassword,
            height: context.screenHeight * AppSize.s03,
          ),
          const SizedBox(height: AppSize.s40),
          CustomFrogetPasswordTextFromFieldSection(formKey: formKey),
        ],
      ),
    );
  }
}

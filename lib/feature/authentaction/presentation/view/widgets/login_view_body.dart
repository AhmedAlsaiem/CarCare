import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/login_text_form_field_section.dart';
import 'custom_logo_auth.dart';
import 'custom_text_button.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomLogoAuth(
            title: StringsManager.login,
            height: context.screenHeight * AppSize.s03,
          ),
          const SizedBox(height: AppSize.s40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
            child: Form(
              key: formKey,
              child: LoginTextFromFieldSection(formKey: formKey),
            ),
          ),
          CustomTextBotton(
            onPress: () {
              NavigatorManager.pushWithReplacement(
                  context: context, route: AppRoutes.chooseAcountType);
            },
          ),
        ],
      ),
    );
  }
}

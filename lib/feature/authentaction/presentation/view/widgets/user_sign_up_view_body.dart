import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/functions/roution_functions/handle_signup_user_state.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/user_cubit/user_cubit.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/user_cubit/user_state.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_logo_auth.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_text_button.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/user_signup_text_form_field_section.dart';

class UserSignUPViewBody extends StatelessWidget {
  const UserSignUPViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();

    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        signUpHandleState(state, context);
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomLogoAuth(
                title: StringsManager.signUp,
                height: context.screenHeight * 0.22,
              ),
              const SizedBox(height: AppSize.s30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
                child: Form(
                  key: formKey,
                  child: UserSignupTextFormFieldSection(formKey: formKey),
                ),
              ),
              CustomTextBotton(
                title: StringsManager.login,
                onPress: () {
                  NavigatorManager.pushWithReplacement(
                      context: context, route: AppRoutes.loginView);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

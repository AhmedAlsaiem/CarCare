import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/user_cubit/user_cubit.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/user_cubit/user_state.dart';
import 'package:splash_app/feature/authentaction/presentation/view/custom_show_snack_bar.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_logo_auth.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_text_button.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/user_signup_text_form_field_section.dart';

import 'custom_circular_progress_indector.dart';

// ignore: must_be_immutable
class UserSignUPViewBody extends StatelessWidget {
  UserSignUPViewBody({super.key});
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is IsLoadingUserState) {
          const CustomCircularProgressIndicator();
        } else if (state is SuccessUserState) {
          NavigatorManager.pushName(
              context: context, route: AppRoutes.otpAcoutVerification);
        } else if (state is FaliureUserState) {
          customShowSnackBar(context, state.errorMessage);
        }
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

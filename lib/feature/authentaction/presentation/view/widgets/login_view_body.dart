import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/user_cubit/user_cubit.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/user_cubit/user_state.dart';
import 'package:splash_app/feature/authentaction/presentation/view/custom_show_snack_bar.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_circular_progress_indector.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/login_text_form_field_section.dart';
import 'custom_logo_auth.dart';
import 'custom_text_button.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is IsLoadingUserState) {
          const CustomCircularProgressIndicator();
        } else if (state is FaliureUserState) {
          customShowSnackBar(context, state.errorMessage);
        } else if (state is SuccessUserState) {
          customShowSnackBar(context, state.successMessage!);
        }
      },
      builder: (context, state) {
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
                title: StringsManager.signUp,
                onPress: () {
                  NavigatorManager.pushWithReplacement(
                      context: context, route: AppRoutes.chooseAcountType);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

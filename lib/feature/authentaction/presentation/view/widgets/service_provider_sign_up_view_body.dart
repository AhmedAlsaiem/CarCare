import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/service_provider_cubit/service_Provider_cubit.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/service_provider_cubit/service_provider_state.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_circular_progress_indector.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/service_provider_sign_up_text_from_field_section.dart';

import '../custom_show_snack_bar.dart';
import 'custom_logo_auth.dart';
import 'custom_text_button.dart';

class ServiceProviderSignUpViewBody extends StatelessWidget {
  ServiceProviderSignUpViewBody({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiceProviderCubit, ServiceProviderState>(
      listener: (context, state) {
        if (state is IsLoadingServiceProviderState) {
          const CustomCircularProgressIndicator();
        } else if (state is SuccessServiceProviderState) {
          customShowSnackBar(context, state.successMessage!);
          NavigatorManager.pushWithReplacement(
              context: context, route: AppRoutes.otpAcoutVerification);
        } else if (state is FaliureServiceProviderState) {
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
                height: context.screenHeight * 0.20,
              ),
              const SizedBox(height: AppSize.s30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
                child: Form(
                  key: formKey,
                  child: ServiceProviderSignUpTextFromFieldSection(
                      formKey: formKey),
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


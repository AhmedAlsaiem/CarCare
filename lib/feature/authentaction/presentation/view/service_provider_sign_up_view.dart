import 'package:flutter/material.dart';
import 'package:splash_app/core/widgets/custom_app_bar.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/service_provider_sign_up_view_body.dart';

class ServiceProviderSignUpView extends StatelessWidget {
  const ServiceProviderSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:customAppBar(),
      body: ServiceProviderSignUpViewBody(),
    );
  }
}

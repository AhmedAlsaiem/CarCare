import 'package:flutter/material.dart';
import 'package:splash_app/core/widgets/custom_app_bar.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: LoginViewBody(),
    );
  }

}

import 'package:flutter/material.dart';
import 'package:splash_app/core/widgets/custom_app_bar.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/change_password_otp_verification_body.dart';

class VerifyAcountView extends StatelessWidget {
  const VerifyAcountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: const ChangePasswordOtpVerificationBody(),
    );
  }
}

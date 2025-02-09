import 'package:flutter/material.dart';
import 'package:splash_app/core/widgets/custom_app_bar.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/otp_verification_body.dart';

class OtpAcountVerification extends StatelessWidget {
  const OtpAcountVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: const OtpAcountVerificationBody(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/otp_verification_body.dart';

class OtpAcountVerification extends StatelessWidget {
  const OtpAcountVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: ColorsManager.white,
            )),
      ),
      body: const OtpAcountVerificationBody(),
    );
  }
}

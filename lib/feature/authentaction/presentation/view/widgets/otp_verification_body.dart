import 'package:flutter/material.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_logo_auth.dart';

class OtpAcountVerificationBody extends StatelessWidget {
  const OtpAcountVerificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLogoAuth(
            title: 'Verification Code ', height: context.screenHeight * 0.22),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                'We have send verification code to ',
                style: StylesManager.textStyleRegular22
                    .copyWith(color: const Color.fromARGB(164, 0, 0, 0)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
//do el saha
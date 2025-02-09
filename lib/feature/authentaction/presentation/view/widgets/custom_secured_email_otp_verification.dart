
import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class CustomotpVerificationSecureTextEmail extends StatelessWidget {
  const CustomotpVerificationSecureTextEmail({
    super.key,
    required this.secureEmail,
  });

  final String secureEmail;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: double.infinity),
        Text(
          StringsManager.weHaveSendVerification,
          style: StylesManager.textStyleRegular18
              .copyWith(color: const Color.fromARGB(218, 0, 0, 0)),
        ),
        Text(secureEmail,
            style: StylesManager.textStyleBold17
                .copyWith(color: ColorsManager.mainColor)),
      ],
    );
  }
}
//do el saha

import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/assets_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/widgets/custom_text_button.dart';

import 'custom_user_type.dart';

class ChooseAcountTypeSection extends StatefulWidget {
  const ChooseAcountTypeSection({
    super.key,
  });

  @override
  State<ChooseAcountTypeSection> createState() =>
      _ChooseAcountTypeSectionState();
}

class _ChooseAcountTypeSectionState extends State<ChooseAcountTypeSection> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
      child: Column(
        children: [
          CustomUserType(
            value: value,
            title: StringsManager.user,
            imageUrl: AssetsManager.user,
            onTap: () {
              value = false;
              setState(() {});
            },
          ),
          const SizedBox(height: 30),
          CustomUserType(
            value: !value,
            title: StringsManager.technical,
            imageUrl: AssetsManager.technical,
            onTap: () {
              value = true;
              setState(() {});
            },
          ),
          const SizedBox(
            height: 40,
          ),
          CustomButton(
              onPressed: () {
                if (value == false) {
                  NavigatorManager.pushWithReplacement(
                      context: context, route: AppRoutes.userSginUpView);
                } else {
                  NavigatorManager.pushWithReplacement(
                      context: context, route: AppRoutes.serviceTypeView);
                }
              },
              bottonName: StringsManager.signUp)
        ],
      ),
    );
  }
}

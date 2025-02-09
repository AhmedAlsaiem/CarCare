
import 'package:flutter/material.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/choose_acount_type_section.dart';

import 'custom_logo_auth.dart';

class ChooseAcountTypeBody extends StatelessWidget {
  const ChooseAcountTypeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomLogoAuth(
          title: StringsManager.chooseType,
          height: context.screenHeight * 0.2,
        ),
        const SizedBox(height: AppSize.s30),
        const ChooseAcountTypeSection(),
      ],
    );
  }
}

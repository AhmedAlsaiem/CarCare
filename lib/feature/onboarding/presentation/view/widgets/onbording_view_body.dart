import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:splash_app/core/functions/system_overlay_status_bar_color.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/assets_manager.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

import 'custom_onboarding_image.dart';
import 'custom_onboarding_text.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    changeStatusBarColor();
    return SafeArea(
        child: Container(
      width: AppSize.infinty,
      color: ColorsManager.white,
      child: OnBoardingSlider(
        onFinish: () {},
        trailingFunction: () {},
        controllerColor: ColorsManager.mainColor,
        centerBackground: true,
        pageBackgroundColor: ColorsManager.white,
        headerBackgroundColor: ColorsManager.white,
        finishButtonText: StringsManager.register,
        finishButtonStyle: const FinishButtonStyle(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s12))),
          backgroundColor: ColorsManager.mainColor,
        ),
        skipTextButton: Text(
          StringsManager.skip,
          style: StylesManager.textStyleSemiBold18,
        ),
        trailing: Text(
          StringsManager.login,
          style: StylesManager.textStyleSemiBold18,
        ),
        background: const [
          CustomOnboardingImage(image: AssetsManager.onboarding1),
          CustomOnboardingImage(image: AssetsManager.onboarding2),
          CustomOnboardingImage(image: AssetsManager.onboarding3),
        ],
        totalPage: 3,
        speed: 1,
        pageBodies: const [
          CustomOnboardingText(
            title: StringsManager.startNow,
            subTitle: StringsManager.onboardingSubtitle1,
          ),
          CustomOnboardingText(
            title: StringsManager.startNow,
            subTitle: StringsManager.onboardingSubtitle2,
          ),
          CustomOnboardingText(
            title: StringsManager.startNow,
            subTitle: StringsManager.onboardingSubtitle3,
          )
        ],
      ),
    ));
  }
}

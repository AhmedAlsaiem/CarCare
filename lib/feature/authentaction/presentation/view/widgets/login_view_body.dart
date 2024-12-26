import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_text_form_field.dart';
import 'custom_logo_auth.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomLogoAuth(title: StringsManager.login),
        const SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
          child: Column(
            children: [
              CustomTextFormField(
                  textInputType: TextInputType.number,
                  label: StringsManager.login,
                  icon: const Icon(Icons.phone_android_rounded),
                  onchange: (value) {}),
              const SizedBox(
                height: AppSize.s20,
              ),
              CustomTextFormField(
                  label: StringsManager.password,
                  icon: const Icon(Icons.password),
                  onchange: (value) {}),
              const SizedBox(
                height: AppSize.s150,
              ),
              TextButton(
                onPressed: () {},
                style: const ButtonStyle(
                    minimumSize: WidgetStatePropertyAll(
                        Size(double.infinity, AppSize.s70)),
                    backgroundColor:
                        WidgetStatePropertyAll(ColorsManager.mainColor),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(AppSize.s12))))),
                child: Text(
                  StringsManager.login,
                  style: StylesManager.textStyleBold24,
                ),
              ),
              const SizedBox(height: AppSize.s10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    StringsManager.dontHaveAcount,
                    style: StylesManager.textStyleRegular17.copyWith(
                      color: ColorsManager.black,
                    ),
                  ),
                  TextButton(
                    style:const ButtonStyle(
                        padding: WidgetStatePropertyAll(EdgeInsets.all(6))),
                    onPressed: () {},
                    child: Text(
                      StringsManager.signUp,
                      style: StylesManager.textStyleBold17
                          .copyWith(color: ColorsManager.mainColor),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

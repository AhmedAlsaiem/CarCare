import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class CustomOtpfield extends StatelessWidget {
  const CustomOtpfield({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s68,
      width: AppSize.s64,
      child: TextFormField(
        validator: validtorMethod,
        controller: controller,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else {
            FocusScope.of(context).previousFocus();
          }
        },
        keyboardType: TextInputType.number,
        cursorColor: ColorsManager.mainColor,
        cursorOpacityAnimates: true,
        textAlign: TextAlign.center,
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        style: StylesManager.textStyleBold20
            .copyWith(color: ColorsManager.mainColor),
        decoration: InputDecoration(
          errorStyle: const TextStyle(height: 0, fontSize: 0),
          focusedBorder: outLineInputBorderDecoration(),
          disabledBorder: outLineInputBorderDecoration(),
          focusedErrorBorder: outLineInputBorderDecoration(),
          errorBorder: outLineInputBorderDecoration(),
          enabledBorder: outLineInputBorderDecoration(),
          hintText: "1",
          hintStyle: StylesManager.textStyleRegular22
              .copyWith(color: const Color.fromARGB(187, 35, 81, 161)),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorsManager.mainColor),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  String? validtorMethod(String? value) {
    if (value!.isEmpty) {
      return '';
    } else {
      return '';
    }
  }
}

OutlineInputBorder outLineInputBorderDecoration() {
  return OutlineInputBorder(
    borderSide: BorderSide(
        color: ColorsManager.balck.withValues(alpha: 0.8), width: 1.5),
    borderRadius: const BorderRadius.all(
      Radius.circular(10),
    ),
  );
}

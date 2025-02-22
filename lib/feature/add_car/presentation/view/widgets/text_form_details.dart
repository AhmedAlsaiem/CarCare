import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class TextFormDetails extends StatelessWidget {
  const TextFormDetails({
    super.key,
    required this.labalText,
    required this.hintText,
    required this.valaidText,
    required this.keyboardType,
    required this.controller,
  });
  final String labalText;
  final String hintText;
  final String valaidText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labalText,
          style: StylesManager.textStyleBold12,
        ),
        SizedBox(
          height: AppHeight.h6,
        ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          cursorColor: ColorsManager.mainColor,
          decoration: InputDecoration(
              focusedErrorBorder: customOutLineInputBorder(),
              errorBorder: customOutLineInputBorder(),
              focusedBorder: customOutLineInputBorder(),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(AppSize.s4),
              ),
              hintText: hintText,
              errorStyle: const TextStyle(color: ColorsManager.balck),
              hintStyle: StylesManager.textStyleRegular14
                  .copyWith(color: ColorsManager.balck.withAlpha(90))),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return valaidText;
            }
            return null;
          },
        ),
      ],
    );
  }

  OutlineInputBorder customOutLineInputBorder() {
    return OutlineInputBorder(
      borderSide:
          const BorderSide(color: ColorsManager.mainColor, width: AppSize.s2),
      borderRadius: BorderRadius.circular(AppSize.s4),
    );
  }
}

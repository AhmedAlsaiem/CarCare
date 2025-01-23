import 'package:flutter/material.dart';
import 'package:screenutil_module/main.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/font_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';

class InteractivePlateCell extends StatelessWidget {
  final String hintText;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final TextInputType keyboardType;

  const InteractivePlateCell({
    super.key,
    required this.hintText,
    required this.focusNode,
    this.nextFocusNode,
     required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Appwidth.w40,
      height: AppHeight.h50,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: ColorsManager.balck),
        borderRadius: BorderRadius.circular(AppSize.s4.r),
      ),
      alignment: Alignment.center,
      child: TextFormField(
        textAlign: TextAlign.center,
        focusNode: focusNode,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          hintStyle:
              TextStyle(color: ColorsManager.grey, fontSize: FontSize.s14),
        ),
        style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        maxLength: 1, // Restrict to one character
        keyboardType: keyboardType,
        cursorColor: ColorsManager.mainColor,

        onChanged: (value) {
          if (value.isNotEmpty) {
            // Move to the next focus node when the user types a character
            nextFocusNode?.requestFocus();
          }
        },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return StringsManager.pleaseEnterAllPlates;
            }
            return null;
          },
      ),
    );
  }
}

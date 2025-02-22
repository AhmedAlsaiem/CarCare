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
  final int charNumber;
  final double fieldWidth;
  final TextStyle? textstyle;
  final TextEditingController controller;
  const InteractivePlateCell({
    super.key,
    required this.hintText,
    required this.focusNode,
    this.nextFocusNode,
    required this.keyboardType,
    required this.textstyle,
    required this.controller,
    this.charNumber = 1,
    this.fieldWidth = AppSize.s52,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: fieldWidth,
      height: AppHeight.h50,
      decoration: BoxDecoration(
        color: ColorsManager.mainColor.withAlpha(30),
        //  border: Border.all(color: ColorsManager.balck),
        borderRadius: BorderRadius.circular(AppSize.s4.r),
      ),
      alignment: Alignment.center,
      child: TextFormField(
        controller: controller,
        inputFormatters: [DashTextFormatter()],
        textDirection: TextDirection.rtl,
        //  controller: _controller,
        textAlign: TextAlign.center,
        focusNode: focusNode,
        cursorErrorColor: ColorsManager.mainColor,
        decoration: InputDecoration(
          counterText: '',
          hintText: hintText,
          focusedErrorBorder: customInputBorder(),
          disabledBorder: customInputBorder(),
          focusedBorder: customInputBorder(),
          enabledBorder: customInputBorder(),
          errorBorder: customInputBorder(),
          border: customInputBorder(),
          hintStyle:
              TextStyle(color: ColorsManager.black, fontSize: FontSize.s14),
        ),
        style: textstyle!.copyWith(color: ColorsManager.balck),
        maxLength: charNumber, // Restrict to one character
        autocorrect: true,
        keyboardType: keyboardType,
        cursorColor: ColorsManager.mainColor,

        onChanged: (value) {
          if (value.isNotEmpty) {
            nextFocusNode?.requestFocus();
          }
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return StringsManager.emptyString;
          }
          return null;
        },
      ),
    );
  }

  OutlineInputBorder customInputBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(
      color: ColorsManager.mainColor.withAlpha(30),
    ));
  }
}

class DashTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text.replaceAll('-', '');
    String formattedText = text.split('').join('-');

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

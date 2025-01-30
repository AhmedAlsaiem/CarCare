import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {super.key,
      required this.label,
      required this.icon,
      required this.onchange,
      this.textInputType});
  final String label;
  final Icon icon;
  final void Function(String) onchange;
  final TextInputType? textInputType;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      style: StylesManager.textStyleRegular18.copyWith(
        color: ColorsManager.balck,
      ),
      cursorColor: ColorsManager.mainColor,
      onChanged: widget.onchange,
      obscureText: obscureTextMethod(),

      // widget.label == 'Password' ? visible : false,
      decoration: customInputDecorcationFunction(),
      validator: validtorMethod,
    );
  }

  InputDecoration customInputDecorcationFunction() {
    return InputDecoration(
      filled: true,
      fillColor: ColorsManager.grey.withAlpha(AppSize.s100.toInt()),
      errorStyle: const TextStyle(color: ColorsManager.mainColor),
      contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSize.s20, vertical: AppSize.s18),
      labelText: widget.label,
      labelStyle:
          StylesManager.textStyleMedium18.copyWith(color: ColorsManager.balck),
      suffixIconColor: ColorsManager.mainColor,
      prefixIconColor: ColorsManager.mainColor,
      suffixIcon: suffixIconMethod(),
      prefixIcon: widget.icon,
      disabledBorder: customOutlineInputBorder(color: ColorsManager.black),
      border: customOutlineInputBorder(color: ColorsManager.balck),
      errorBorder: customOutlineInputBorder(color: ColorsManager.mainColor),
      enabledBorder: customOutlineInputBorder(color: ColorsManager.black),
      focusedBorder: customOutlineInputBorder(color: ColorsManager.balck),
      focusedErrorBorder:
          customOutlineInputBorder(color: ColorsManager.mainColor),
    );
  }

  String? validtorMethod(String? value) {
    if (value!.isEmpty) {
      return '${widget.label} ${StringsManager.isRequired} ';
    } else {
      if (value.length != 11 && widget.label == StringsManager.phoneNumber) {
        return '${StringsManager.wThis} ${widget.label} ${StringsManager.isNotCorrectFormat}';
      } else if (value.length >= 11 &&
          widget.label == StringsManager.email &&
          value.substring(value.length - 11) == StringsManager.gmailcom) {
        return '${StringsManager.wThis} ${widget.label} ${StringsManager.isNotCorrectFormat}';
      } else if (value.length != 14 && widget.label == StringsManager.id) {
        return '${StringsManager.wThis} ${widget.label} ${StringsManager.isNotCorrectFormat}';
      } else if (widget.label == StringsManager.phoneNumber) {
        if (value.substring(0, 2) != StringsManager.zeroOne) {
          return '${StringsManager.wThis} ${widget.label} ${StringsManager.isNotCorrectFormat}';
        } else {
          return null;
        }
      } else if (value.length <= 6 &&
          (widget.label == StringsManager.password ||
              widget.label == StringsManager.newPassword ||
              widget.label == StringsManager.confirmPassword)) {
        return StringsManager.passwordShort;
      } else if ((widget.label == StringsManager.email) && value.length <= 10) {
        return '${StringsManager.wThis} ${widget.label} ${StringsManager.notCorrectEmail}';
      } else {
        return null;
      }
    }
  }

  OutlineInputBorder customOutlineInputBorder({required Color color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
      ),
      borderRadius: BorderRadius.circular(8),
    );
  }

  bool obscureTextMethod() {
    if (widget.label == StringsManager.password ||
        widget.label == StringsManager.newPassword ||
        widget.label == StringsManager.confirmPassword) {
      return visible;
    } else {
      return false;
    }
  }

  Widget? suffixIconMethod() {
    if (widget.label == StringsManager.password ||
        widget.label == StringsManager.newPassword ||
        widget.label == StringsManager.confirmPassword) {
      return IconButton(
        onPressed: () {
          if (visible == true) {
            visible = false;
            setState(() {});
          } else {
            visible = true;
            setState(() {});
          }
        },
        icon: Icon(visible == true ? Icons.visibility : Icons.visibility_off),
      );
    } else {
      return null;
    }
  }
}

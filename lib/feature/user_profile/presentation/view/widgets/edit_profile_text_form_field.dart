import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/user_profile/presentation/view/widgets/custom_svg_icon.dart';

class EditProfileTextFormField extends StatefulWidget {
  const EditProfileTextFormField(
      {super.key,
      required this.label,
      required this.controller,
      required this.icon,
      required this.onchange,
      this.textInputType});
  final String label;
  final String icon;
  final void Function(String) onchange;
  final TextInputType? textInputType;
  final TextEditingController controller;
  @override
  State<EditProfileTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<EditProfileTextFormField> {
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.textInputType,
        style: StylesManager.textStyleRegular14.copyWith(
          color: ColorsManager.balck,
        ),
        cursorColor: ColorsManager.mainColor,
        onChanged: widget.onchange,
        obscureText: obscureTextMethod(),

        // widget.label == 'Password' ? visible : false,
        decoration: customInputDecorcationFunction(),
        validator: validtorMethod,
      ),
    );
  }

  InputDecoration customInputDecorcationFunction() {
    return InputDecoration(
      filled: true,
      fillColor: ColorsManager.white,
      errorStyle: const TextStyle(color: ColorsManager.mainColor),
      contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSize.s20, vertical: AppSize.s4),
      labelText: widget.label,
      labelStyle:
          StylesManager.textStyleRegular14.copyWith(color: ColorsManager.balck),
      suffixIconColor: ColorsManager.mainColor,
      prefixIconColor: ColorsManager.mainColor,
      suffixIcon: suffixIconMethod(),
      prefixIconConstraints: const BoxConstraints(minWidth: 34, minHeight: 36),
      prefixIcon: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: CustomSvgIcon(imagePath: widget.icon),
      ),
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
          value.substring(value.length - 10, value.length) !=
              StringsManager.gmailcom) {
        return '${StringsManager.wThis} ${widget.label} ${StringsManager.isNotCorrectFormat}';
      } else if (value.length != 14 &&
          widget.label == StringsManager.nationalId) {
        return '${StringsManager.wThis} ${widget.label} ${StringsManager.isNotCorrectFormat}';
      } else if (widget.label == StringsManager.phoneNumber) {
        if (value.substring(0, 2) != StringsManager.zeroOne) {
          return '${StringsManager.wThis} ${widget.label} ${StringsManager.isNotCorrectFormat}';
        } else {
          return null;
        }
      } else if (value.length <= 1 &&
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

  UnderlineInputBorder customOutlineInputBorder({required Color color}) {
    return UnderlineInputBorder(
      borderSide: const BorderSide(
        color: ColorsManager.white,
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

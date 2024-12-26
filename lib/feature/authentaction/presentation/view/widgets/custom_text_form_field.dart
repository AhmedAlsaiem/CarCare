import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/font_manager.dart';

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
      style: TextStyle(
          color: ColorsManager.balck,
          fontWeight: AppFontWieght.medium,
          fontSize: 18),
      cursorColor: ColorsManager.mainColor,
      onChanged: widget.onchange,
      obscureText: obscureTextMethod(),

      // widget.label == 'Password' ? visible : false,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorsManager.grey.withOpacity(0.2),
        errorStyle: const TextStyle(color: ColorsManager.red),
        contentPadding: const EdgeInsets.all(20),
        labelText: widget.label,
        labelStyle: const TextStyle(
          color: ColorsManager.balck,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        suffixIconColor: ColorsManager.mainColor,
        prefixIconColor: ColorsManager.mainColor,
        suffixIcon: suffixIconMethod(),
        prefixIcon: widget.icon,
        disabledBorder: customOutlineInputBorder(color: ColorsManager.black),
        border: customOutlineInputBorder(color: ColorsManager.balck),
        errorBorder: customOutlineInputBorder(color: ColorsManager.red),
        enabledBorder: customOutlineInputBorder(color: ColorsManager.black),
        focusedBorder: customOutlineInputBorder(color: ColorsManager.balck),
        focusedErrorBorder: customOutlineInputBorder(color: ColorsManager.red),
      ),
      validator: validtorMethod,
    );
  }

  String? validtorMethod(String? value) {
    if (value!.isEmpty) {
      return '${widget.label} is required';
    } else {
      if (value.length <= 10 && widget.label == 'Email') {
        return 'this ${widget.label} is not correct fromat';
      } else if (widget.label == 'Email') {
        if (value.substring(value.length - 10, value.length) != '@gmail.com') {
          return 'this ${widget.label} is not correct fromat';
        } else {
          return null;
        }
      } else if (value.length <= 6 &&
          (widget.label == 'Password' ||
              widget.label == 'New password' ||
              widget.label == 'Confirm Password')) {
        return 'this Password is very short';
      } else if ((widget.label == 'Email') && value.length <= 10) {
        return 'this ${widget.label} is not correct email';
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
    if (widget.label == 'Password' ||
        widget.label == 'New password' ||
        widget.label == 'Confirm Password') {
      return visible;
    } else {
      return false;
    }
  }

  Widget? suffixIconMethod() {
    if (widget.label == 'Password' ||
        widget.label == 'New password' ||
        widget.label == 'Confirm Password') {
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

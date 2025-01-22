import 'package:flutter/material.dart';
import 'package:screenutil_module/main.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';

class InteractivePlateCell extends StatelessWidget {
  final String hintText;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;

  const InteractivePlateCell({
    super.key,
    required this.hintText,
    required this.focusNode,
    this.nextFocusNode,
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

//             ),
          border: InputBorder.none,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14.0),
        ),
        style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        maxLength: 1, // Restrict to one character
        keyboardType: TextInputType.text,
        onChanged: (value) {
          if (value.isNotEmpty) {
            // Move to the next focus node when the user types a character
            nextFocusNode?.requestFocus();
          }
        },
      ),
    );
  }
}

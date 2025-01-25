import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class TextFormDetails extends StatelessWidget {
 const  TextFormDetails({
    super.key,
    required this.labalText,
    required this.hintText,
    required this.valaidText,

  });
  final String labalText;
  final String hintText;
  final String valaidText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labalText,

        ),
        SizedBox(
          height: AppHeight.h6,
        ),
        TextFormField(
          
          cursorColor: ColorsManager.mainColor,
          decoration: InputDecoration(
             focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorsManager.mainColor, width: 2.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            border:  OutlineInputBorder(
 borderSide: const BorderSide(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(8.0),
              
            ),
            hintText: hintText,
            hintStyle: StylesManager.textStyleRegular14.copyWith(color: ColorsManager.balck.withAlpha(90))
          ),
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
}

import 'package:flutter/material.dart';
import 'package:screenutil_module/main.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class TextformFieldInParkingView extends StatelessWidget {
  const TextformFieldInParkingView({
    required this.title,
    super.key,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: Appwidth.w100,
          child: Text(
            title,
            style: StylesManager.textStyleBold20black,
          ),
        ),
        SizedBox(width: Appwidth.w8), // Horizontal spacing between widgets.
        SizedBox(
          width: 100,
          child: TextFormField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              // hintText: 'Enter amount', // Optional hint for user clarity.
              // hintStyle: TextStyle(color: Colors.grey),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: ColorsManager.mainColor, width: 2.0),
                borderRadius: BorderRadius.circular(AppSize.s08.r),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(AppSize.s08.r),
              ),
            ),
             validator: (value) {
            if (value == null || value.isEmpty) {
              return StringsManager.thisfieldisrequired;
            }
            return null;
          },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:screenutil_module/main.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class ChoiseAmount extends StatelessWidget {
  const ChoiseAmount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(AppSize.s12.r),
      child: Row(
        children: [
          Text(
            StringsManager.howmuch,
            style: StylesManager.textStyleBold20black,
          ),
          SizedBox(
            width:Appwidth.w8 ,
          ),
          SizedBox(
            width: Appwidth.w50,
            // height: 4,
            child: TextFormField(
              keyboardType: TextInputType.number,
              initialValue: "1",
                 textAlign: TextAlign.center,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: ColorsManager.mainColor, width: 2.0),
                  borderRadius: BorderRadius.circular(AppSize.s08.r),
                ),
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(AppSize.s08.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

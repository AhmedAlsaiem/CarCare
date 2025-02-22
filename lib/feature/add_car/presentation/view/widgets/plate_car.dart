import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screenutil_module/main.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/add_car/presentation/view/widgets/plate_care_item.dart';

import '../../manager/cubit/car_cubit.dart';

class EgyptianCarPlateWithFocus extends StatefulWidget {
  const EgyptianCarPlateWithFocus({super.key, required this.globalKey});
  final GlobalKey<FormState> globalKey;
  @override
  EgyptianCarPlateWithFocusState createState() =>
      EgyptianCarPlateWithFocusState();
}

class EgyptianCarPlateWithFocusState extends State<EgyptianCarPlateWithFocus> {
  // Define FocusNodes for each input field
  final List<FocusNode> _focusNodes =
      List.generate(4, (_) => FocusNode()); // 3 letters + 3 numbers

  @override
  void dispose() {
    // Dispose of the FocusNodes to prevent memory leaks
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: ColorsManager.lightGrey,
        margin: EdgeInsets.only(
            left: Appwidth.w22, right: Appwidth.w22.w, top: Appwidth.w16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(AppSize.s8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                StringsManager.addYourCarIsPlate,
                style: TextStyle(
                    fontSize: AppSize.s20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: AppSize.s2),
              // Country and Region Row
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.s12,
                ),
                decoration: const BoxDecoration(
                  color: ColorsManager.mainColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(AppSize.s6)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(StringsManager.egyptEnglish,
                        style: StylesManager.textStyleRegular17),
                    Text(StringsManager.egyptArbic,
                        style: StylesManager.textStyleRegular17),
                  ],
                ),
              ),

              Container(
                color: ColorsManager.grey,
                padding: EdgeInsets.all(AppSize.s8.r),
                child: Row(
                  children: [
                    // Arabic Letters Section
                    Expanded(
                      flex: 6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InteractivePlateCell(
                            controller: context.read<CarCubit>().plateN1,
                            textstyle: StylesManager.textStyleRegular18,
                            hintText: "-",
                            focusNode: _focusNodes[0],
                            nextFocusNode: _focusNodes[1],
                            keyboardType: TextInputType.number,
                          ),
                          InteractivePlateCell(
                            controller: context.read<CarCubit>().plateN2,
                            textstyle: StylesManager.textStyleRegular18,
                            hintText: "-",
                            focusNode: _focusNodes[1],
                            nextFocusNode: _focusNodes[2],
                            keyboardType: TextInputType.number,
                          ),
                          InteractivePlateCell(
                            controller: context.read<CarCubit>().plateN3,
                            textstyle: StylesManager.textStyleRegular18,
                            hintText: "-",
                            focusNode: _focusNodes[2],
                            nextFocusNode: _focusNodes[3],
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                    //   const VerticalDivider(color: Colors.red, thickness: 1.0),
                    // English Numbers Section
                    Expanded(
                      flex: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InteractivePlateCell(
                            controller: context.read<CarCubit>().plateChar,
                            textstyle: StylesManager.textStyleBold22black,
                            charNumber: 5,
                            hintText: "   -     -      -   ",
                            focusNode: _focusNodes[3],
                            nextFocusNode: _focusNodes[3],
                            keyboardType: TextInputType.text,
                            fieldWidth: AppSize.s140,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppHeight.h20),
            ],
          ),
        ),
      ),
    );
  }
}

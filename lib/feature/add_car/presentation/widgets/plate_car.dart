import 'package:flutter/material.dart';
import 'package:screenutil_module/main.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/font_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/add_car/presentation/widgets/plate_care_item.dart';

class EgyptianCarPlateWithFocus extends StatefulWidget {
  const EgyptianCarPlateWithFocus({super.key});

  @override
  EgyptianCarPlateWithFocusState createState() =>
      EgyptianCarPlateWithFocusState();
}

class EgyptianCarPlateWithFocusState extends State<EgyptianCarPlateWithFocus> {
  // Define FocusNodes for each input field
  final List<FocusNode> _focusNodes =
      List.generate(6, (_) => FocusNode()); // 3 letters + 3 numbers

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
    return 
   
      Center(
        child: Card(
           color: ColorsManager.white.withValues(),
                  margin: EdgeInsets.only(
                      left: Appwidth.w22, right: Appwidth.w22, top: Appwidth.w16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s12),
                  ),
                  elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
               const Text(
                StringsManager.addYourCarIsPlate,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12.0),
              // Country and Region Row
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(StringsManager.egyptEnglish, style: TextStyle(fontSize: FontSize.s16)),
                    Text(StringsManager.egyptArbic, style: TextStyle(fontSize: FontSize.s16)),
                  ],
                ),
              ),
            
              Container(
                padding:  EdgeInsets.all(AppSize.s8.r),
               
                child: Row(
                  children: [
                    // Arabic Letters Section
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InteractivePlateCell(
                            hintText: "5",
                            focusNode: _focusNodes[0],
                            nextFocusNode: _focusNodes[1],
                            keyboardType: TextInputType.number,
                          ),
                          InteractivePlateCell(
                            hintText: "7",
                            focusNode: _focusNodes[1],
                            nextFocusNode: _focusNodes[2],
                            keyboardType: TextInputType.number,

                          ),
                          InteractivePlateCell(
                            hintText: "9",
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InteractivePlateCell(
                            hintText: "د",
                            focusNode: _focusNodes[3],
                            nextFocusNode: _focusNodes[4],
                            keyboardType: TextInputType.text,

                          ),
                          InteractivePlateCell(
                            hintText: "ل",
                            focusNode: _focusNodes[4],
                            keyboardType: TextInputType.text,
                            nextFocusNode: _focusNodes[5],
                            
                          ),
                          InteractivePlateCell(
                            hintText: "ع",
                            focusNode: _focusNodes[5],
                            keyboardType: TextInputType.text,

                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      
    );
  }
}

import 'package:flutter/material.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

import 'request_button.dart';

class WinchCarViewBody extends StatefulWidget {
  const WinchCarViewBody({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WinchCarViewBodyState createState() => _WinchCarViewBodyState();
}

class _WinchCarViewBodyState extends State<WinchCarViewBody> {
  String? selectedOption;

  final List<Map<String, String>> options = [
    {
      'title': ' Electric',
      'description': ' Common for smaller vehicles and occasional use',
      'price': '500'
    },
    {
      'title': ' Hydraulic',
      'description': ' Better for heavy-duty or frequent use.',
      'price': '1000'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(title: Text('Choose an Option')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppHeight.h16,
          ),
          Padding(
            padding: EdgeInsets.only(
                right: Appwidth.w20, top: AppHeight.h12, left: Appwidth.w12),
            child: Text(
              // padd: EdgeInsets.all(20),
              StringsManager.choosehewinchtype,
              style: StylesManager.textStyleBold20black,
            ),
          ),
          Expanded(
            child: ListView(
              children: options.map((option) {
                return RadioListTile<String>(
                  activeColor: ColorsManager.mainColor,
                  title: Text(
                    option['title']!,
                    style: TextStyle(
                      color: selectedOption == option['title']
                          ? ColorsManager.mainColor
                          : ColorsManager.balck,
                      fontWeight: selectedOption == option['title']
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  secondary: Text(
                    '${option['price']!} EGP',
                  ),
                  subtitle: Text(
                    option['description']!,
                  ), // Add description here
                  value: option['title']!,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value;
                    });
                  },
                );
              }).toList(),
            ),
          ),
          // const ChoiseAmount(),
          SizedBox(
            height: context.screenHeight * .2,
          ),
          RequesButton(
            selectedOption: selectedOption ?? ' ',
          ),
          SizedBox(
            height: AppHeight.h30,
          )
        ],
      ),
    );
  }
}
